import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Dialog;
import 'dart:async';

import 'package:flutter_image/control/TitanControlStyle.dart';

const bool __printDebug = false;
typedef PickerSelectedCallback = void Function(
    TitanPicker picker, int index, List<int> selecteds);
typedef PickerConfirmCallback = void Function(
    TitanPicker picker, List<int> selecteds);
typedef PickerValueFormat<T> = String Function(T value);

class TitanPicker {
  static const double DefaultTextSize = 20.0;
  List<int> selecteds;
  final PickerAdapter adapter;

  final VoidCallback onCancel;
  final PickerSelectedCallback onSelect;
  final PickerConfirmCallback onConfirm;
  final changeToFirst;
  final Widget title;
  final String cancelText;
  final String confirmText;

  final double height;
  final double itemExtent;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final double textScaleFactor;
  final EdgeInsets columnPadding;
  final Color backgroundColor, headercolor, containerColor;
  final bool hideHeader;
  final bool reversedOrder;
  final WidgetBuilder builderHeader;
  final bool looping;
  final int smooth;
  final Widget footer;
  final double magnification;
  Widget _widget;
  PickerWidgetState _state;

  TitanPicker(
      {this.adapter,
      this.selecteds,
      this.height = 150.0,
      this.itemExtent = 30.0,
      this.columnPadding = const EdgeInsets.symmetric(horizontal:0.0),
      this.textStyle,
      this.textAlign = TextAlign.center,
      this.textScaleFactor,
      this.title,
      this.cancelText,
      this.confirmText,
      this.backgroundColor,
      this.containerColor,
      this.headercolor,
      this.builderHeader,
      this.changeToFirst = false,
      this.hideHeader = false,
      this.looping = false,
      this.reversedOrder = false,
      this.footer,
      this.smooth,
      this.magnification = 1.3,
      this.onCancel,
      this.onSelect,
      this.onConfirm})
      : assert(adapter != null);

  Widget get widget => _widget;
  PickerWidgetState get state => _state;
  int _maxLevel = 1;

  Widget makePicker([ThemeData themeData, bool isModal = false]) {
    _maxLevel = adapter.maxLevel;
    adapter.picker = this;
    adapter.initSelects();
    _widget =
        _PickerWidget(picker: this, themeData: themeData, isModal: isModal);
    return _widget;
  }

  void show(ScaffoldState state, [ThemeData themeData]) {
    state.showBottomSheet((BuildContext context) {
      return makePicker(themeData);
    });
  }

  Future<T> showModal<T>(BuildContext context, [ThemeData themeData]) async {
    return await showModalBottomSheet<T>(
        context: context, //state.context,
        builder: (BuildContext context) {
          return makePicker(themeData, false);
        });
  }

  Future<List<int>> showDialog(BuildContext context,
      {bool barrierDismissible = true, Key key}) {
    return Dialog.showDialog<List<int>>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          List<Widget> actions = [
            FlatButton(
                    onPressed: () {
                      Navigator.pop<List<int>>(context, selecteds);
                      if (onConfirm != null) onConfirm(this, selecteds);
                    },
                    child: Text('Принято', style: textStyle),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop<List<int>>(context, null);
                      if (onCancel != null) onCancel();
                    },
                    child: Text('Выйти', style: textStyle),
                  ),
          ];

          return AlertDialog(
            backgroundColor: Color.fromRGBO(233,200,45,1), 
            titlePadding: EdgeInsets.all(20), 
            titleTextStyle:TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ), 
            contentPadding:EdgeInsets.zero, 
            contentTextStyle:TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ), 
            actionsPadding:EdgeInsets.zero, 
            actionsOverflowDirection: VerticalDirection.down,
            actionsOverflowButtonSpacing: 50.0, 
            buttonPadding: EdgeInsets.all(5.0),
            elevation: 10, 
            semanticLabel: '111', 
            insetPadding: EdgeInsets.all(50.0),
            

            key: key ?? Key('picker-dialog'),
            title: title,
            content: makePicker(),
            actions: actions,
          );
        });
  }

  List getSelectedValues() {
    return adapter.getSelectedValues();
  }

  void doCancel(BuildContext context) {
    if (onCancel != null) onCancel();
    Navigator.of(context).pop<List<int>>(null);
    _widget = null;
  }

  void doConfirm(BuildContext context) {
    if (onConfirm != null) onConfirm(this, selecteds);
    Navigator.of(context).pop();
    _widget = null;
  }

  void updateColumn(int index, [bool all = false]) {
    if (all) {
      _state.update();
      return;
    }
    adapter.setColumn(index - 1);
    _state._keys[index].currentState.update();
  }
}

class PickerDelimiter {
  final Widget child;
  final int column;
  PickerDelimiter({this.child, this.column = 1}) : assert(child != null);
}

class PickerItem<T> {
  final Widget text;
  final T value;
  final List<PickerItem<T>> children;
  PickerItem({this.text, this.value, this.children});
}

class _PickerWidget<T> extends StatefulWidget {
  final TitanPicker picker;
  final ThemeData themeData;
  final bool isModal;
  _PickerWidget(
      {Key key, @required this.picker, @required this.themeData, this.isModal})
      : super(key: key);

  @override
  PickerWidgetState createState() =>
      PickerWidgetState<T>(picker: this.picker, themeData: this.themeData);
}

class PickerWidgetState<T> extends State<_PickerWidget> {
  final TitanPicker picker;
  final ThemeData themeData;
  PickerWidgetState({Key key, @required this.picker, @required this.themeData});

  ThemeData theme;
  final List<FixedExtentScrollController> scrollController = [];
  final List<GlobalKey<_StateViewState>> _keys = [];

  @override
  void initState() {
    super.initState();
    theme = themeData;
    picker._state = this;
    picker.adapter.doShow();

    if (scrollController.length == 0) {
      for (int i = 0; i < picker._maxLevel; i++) {
        scrollController
            .add(FixedExtentScrollController(initialItem: picker.selecteds[i]));
        _keys.add(GlobalKey(debugLabel: i.toString()));
      }
    }
  }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_wait && picker.smooth != null && picker.smooth > 0) {
      Future.delayed(Duration(milliseconds: picker.smooth), () {
        if (!_wait) return;
        setState(() {
          _wait = false;
        });
      });
    } else
      _wait = false;

    var _body = <Widget>[];
    _body.add(_wait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildViews(),
          )
        : AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildViews(),
            ),
          ));

    if (picker.footer != null) _body.add(picker.footer);
    Widget v = Container(
      decoration: BoxDecoration(
        border: Borderic.trb(),
        color: Colors.white, 
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: _body,
    ));
    if (widget.isModal != null && widget.isModal) {
      return GestureDetector(
        onTap: () {},
        child: v,
      );
    }
    return v;
  }

  bool _changeing = false;
  bool _wait = true;
  final Map<int, int> lastData = {};

  List<Widget> _buildViews() {
    if (__printDebug) print("_buildViews");
    if (theme == null) theme = Theme.of(context);

    List<Widget> items = [];

    PickerAdapter adapter = picker.adapter;
    if (adapter != null) adapter.setColumn(-1);

    if (adapter != null && adapter.length > 0) {
      var _decoration = BoxDecoration(
        color: picker.containerColor,
      );

      for (int i = 0; i < picker._maxLevel; i++) {
        Widget view = Expanded(
          flex:1,
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: picker.columnPadding,
            height: picker.height,
            decoration: _decoration,
            child: _wait
                ? null
                : _StateView(
                    key: _keys[i],
                    builder: (context) {
                      adapter.setColumn(i - 1);
                      var _length = adapter.length;
                      var _view = CupertinoPicker.builder(
                        //backgroundColor: picker.backgroundColor,
                        backgroundColor: Colors.white,
                        scrollController: scrollController[i],
                        itemExtent: picker.itemExtent,
                        magnification: picker.magnification,
                        diameterRatio: 2,
                        squeeze: 1,
                        onSelectedItemChanged: (int _index) {
                          if (__printDebug) print("onSelectedItemChanged");
                          if (_length <= 0) return;
                          var index = _index % _length;
                          picker.selecteds[i] = index;
                          updateScrollController(i);
                          adapter.doSelect(i, index);
                          if (picker.changeToFirst) {
                            for (int j = i + 1;
                                j < picker.selecteds.length;
                                j++) {
                              picker.selecteds[j] = 0;
                              scrollController[j].jumpTo(0.0);
                            }
                          }
                          if (picker.onSelect != null)
                            picker.onSelect(picker, i, picker.selecteds);

                          if (adapter.needUpdatePrev(i))
                            setState(() {});
                          else {
                            _keys[i].currentState.update();
                            if (adapter.isLinkage) {
                              for (int j = i + 1;
                                  j < picker.selecteds.length;
                                  j++) {
                                if (j == i) continue;
                                adapter.setColumn(j - 1);
                                _keys[j].currentState.update();
                              }
                            }
                          }
                        },
                        itemBuilder: (context, index) {
                          adapter.setColumn(i - 1);
                          return adapter.buildItem(context, index % _length);
                        },
                        childCount: picker.looping ? null : _length,
                      );

                      if (!picker.changeToFirst &&
                          picker.selecteds[i] >= _length) {
                        Timer(Duration(milliseconds: 100), () {
                          if (__printDebug) print("timer last");
                          adapter.setColumn(i - 1);
                          var _len = adapter.length;
                          var _index = (_len < _length ? _len : _length) - 1;
                          scrollController[i]?.jumpToItem(_index);
                        });
                      }

                      return _view;
                    },
                  ),
          ),
        );
        items.add(view);
      }
    }

    

    if (picker.reversedOrder) return items.reversed.toList();

    return items;
  }

  void updateScrollController(int i) {
    if (_changeing || !picker.adapter.isLinkage) return;
    _changeing = true;
    for (int j = 0; j < picker.selecteds.length; j++) {
      if (j != i) {
        if (scrollController[j].position.maxScrollExtent == null) continue;
        scrollController[j].position.notifyListeners();
      }
    }
    _changeing = false;
  }
}

abstract class PickerAdapter<T> {
  TitanPicker picker;

  int getLength();
  int getMaxLevel();
  void setColumn(int index);
  void initSelects();
  Widget buildItem(BuildContext context, int index);

  bool needUpdatePrev(int curIndex) {
    return false;
  }

  Widget makeText(Widget child, String text, bool isSel) {
    return new Center(
        child: DefaultTextStyle(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: picker.textAlign,
            style: picker.textStyle,
            child: child != null
                ? child
                : Text(text,
                    textScaleFactor: picker.textScaleFactor,
                    style: (isSel ? picker.textStyle : null))));
  }

  String getText() {
    return getSelectedValues().toString();
  }

  List<T> getSelectedValues() {
    return [];
  }

  void doShow() {}
  void doSelect(int column, int index) {}

  

  int get maxLevel => getMaxLevel();
  int get length => getLength();
  String get text => getText();
  bool get isLinkage => getIsLinkage();

  @override
  String toString() {
    return getText();
  }

  bool getIsLinkage() {
    return true;
  }

  void notifyDataChanged() {
    if (picker != null && picker.state != null) {
      picker.adapter.doShow();
      picker.adapter.initSelects();
      for (int j = 0; j < picker.selecteds.length; j++) {
        picker.state.scrollController[j].jumpToItem(picker.selecteds[j]);
      }
    }
  }
}

class NumberPickerColumn {
  final List<int> items;
  final int begin;
  final int end;
  final int initValue;
  final int columnFlex;
  final int jump;
  final Widget postfix, suffix;
  final PickerValueFormat<int> onFormatValue;

  const NumberPickerColumn({
    this.begin = 0,
    this.end = 9,
    this.items,
    this.initValue,
    this.jump = 1,
    this.columnFlex = 1,
    this.postfix,
    this.suffix,
    this.onFormatValue,
  }) : assert(jump != null);

  int indexOf(int value) {
    if (value == null) return -1;
    if (items != null) return items.indexOf(value);
    if (value < begin || value > end) return -1;
    return (value - begin) ~/ (this.jump == 0 ? 1 : this.jump);
  }

  int valueOf(int index) {
    if (items != null) {
      return items[index];
    }
    return begin + index * (this.jump == 0 ? 1 : this.jump);
  }

  String getValueText(int index) {
    return onFormatValue == null
        ? "${valueOf(index)}"
        : onFormatValue(valueOf(index));
  }

  int count() {
    var v = (end - begin) ~/ (this.jump == 0 ? 1 : this.jump) + 1;
    if (v < 1) return 0;
    return v;
  }
}

class NumberPickerAdapter extends PickerAdapter<int> {
  NumberPickerAdapter({this.data}) : assert(data != null);

  final List<NumberPickerColumn> data;
  NumberPickerColumn cur;
  int _col = 0;

  @override
  int getLength() {
    if (cur == null) return 0;
    if (cur.items != null) return cur.items.length;
    return cur.count();
  }

  @override
  int getMaxLevel() {
    return data == null ? 0 : data.length;
  }

  @override
  bool getIsLinkage() {
    return false;
  }

  @override
  void setColumn(int index) {
    if (index != -1 && _col == index + 1) return;
    _col = index + 1;
    if (_col >= data.length) {
      cur = null;
    } else {
      cur = data[_col];
    }
  }

  @override
  void initSelects() {
    int _maxLevel = getMaxLevel();
    if (picker.selecteds == null || picker.selecteds.length == 0) {
      if (picker.selecteds == null) picker.selecteds = new List<int>();
      for (int i = 0; i < _maxLevel; i++) {
        int v = data[i].indexOf(data[i].initValue);
        if (v < 0) v = 0;
        picker.selecteds.add(v);
      }
    }
  }

  @override
  Widget buildItem(BuildContext context, int index) {
    return makeText(
        null, cur.getValueText(index), index == picker.selecteds[_col]);
  }

  

  @override
  List<int> getSelectedValues() {
    List<int> _items = [];
    if (picker.selecteds != null) {
      for (int i = 0; i < picker.selecteds.length; i++) {
        int j = picker.selecteds[i];
        int v = data[i].valueOf(j);
        _items.add(v);
      }
    }
    return _items;
  }
}

class _StateView extends StatefulWidget {
  final WidgetBuilder builder;
  const _StateView({Key key, this.builder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateViewState();
}

class _StateViewState extends State<_StateView> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  update() {
    setState(() {});
  }
}
