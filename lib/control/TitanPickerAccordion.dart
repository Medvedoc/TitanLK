import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanCheckbox.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';

class TitanPickerAccordion extends StatefulWidget {
  TitanPickerAccordion(
      {this.textDialog,
      this.border,
      this.textHeading,
      this.title,
      this.children,
      this.renderKeyHeight11,
      this.callback11,
      this.showAccordion = false,
      this.titleChild,
      this.expandedTitleBackgroundColor = const Color(0xFFE0E0E0),
      this.collapsedIcon = const Icon(Icons.keyboard_arrow_down),
      this.expandedIcon = const Icon(Icons.keyboard_arrow_up),
      this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
      this.titlePadding = const EdgeInsets.all(10),
      this.contentBackgroundColor,
      this.contentPadding = const EdgeInsets.all(10),
      this.titleBorder = const Border(),
      this.contentBorder = const Border(),
      this.margin,
      this.titleBorderRadius = const BorderRadius.all(Radius.circular(0)),
      this.contentBorderRadius = const BorderRadius.all(Radius.circular(0)),
      this.multiAccordion,
      this.onToogle});

  final List<double> border;
  final String textDialog;
  final String textHeading;
  final String title;
  final double renderKeyHeight11;
  final Function(double) callback11;
  final List<Widget> children;
  final bool showAccordion;
  final bool multiAccordion;
  final Widget titleChild;
  final Color expandedTitleBackgroundColor;
  final Widget collapsedIcon;
  final Widget expandedIcon;
  final TextStyle textStyle;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final Color contentBackgroundColor;
  final EdgeInsets margin;
  final Border titleBorder;
  final Border contentBorder;
  final BorderRadius titleBorderRadius;
  final BorderRadius contentBorderRadius;
  final Function() onToogle;
  @override
  _TitanPickerAccordionState createState() => _TitanPickerAccordionState();
}

class _TitanPickerAccordionState extends State<TitanPickerAccordion> with TickerProviderStateMixin {
  final GlobalKey _renderKey = GlobalKey();
  double renderKeyHeight11;
  double renderKeyPosition;
  double screenSize;

  AnimationController controllerAccordion;
  Animation<Offset> offset;
  bool showAccordion;
  bool isSwitched = false;
  bool abc = false;

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

  String toTime = DateFormat.Hm().format(new DateTime.now());
  String fromTime = DateFormat.Hm().format(new DateTime.now());
  String toTimeHour;
  String toTimeMinute;
  String fromTimeHour;
  String fromTimeMinute;
  bool isChecked = false;
  bool isSwitched2 = false;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    //print('1111 ${renderKeyHeight11}');
    return Column(
      key: _renderKey,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          decoration: new BoxDecoration(
            color: Colors.grey.shade200,
            border: new Border(
              top: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: widget.border != null ? widget.border[0] : 1.0,
              ),
              right: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: widget.border != null ? widget.border[1] : 1.0,
              ),
              bottom: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: widget.border != null ? widget.border[2] : 1.0,
              ),
              left: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: widget.border != null ? widget.border[3] : 1.0,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    // new Text("$abc"),
                    TitanCheckBox(
                      abc: abc,
                      callback: callback,
                      onTap: (selected) {
                        toggleAccordion();
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      widget.textHeading != null ? widget.textHeading : '',
                      //'ПН-ВС',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'до ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(0, 0, 0, abc != true ? 1 : 0.2),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showPickerNumberFormatValue(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70.0,
                        height: 30.0,
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color.fromRGBO(0, 0, 0, abc != true ? 1 : 0.2), width: 1.0, style: BorderStyle.solid),
                        ),
                        child: Text('$toTime',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(0, 0, 0, abc != true ? 1 : 0.2),
                            )),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'после ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(0, 0, 0, abc != true ? 1 : 0.2),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showPickerNumberFormatValue(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70.0,
                        height: 30.0,
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color.fromRGBO(0, 0, 0, abc != true ? 1 : 0.2), width: 1.0, style: BorderStyle.solid),
                        ),
                        child: Text('$fromTime',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(0, 0, 0, abc != true ? 1 : 0.2),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        showAccordion
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: widget.contentBorderRadius,
                  border: widget.contentBorder,
                  color: widget.contentBackgroundColor ?? Colors.white70,
                ),
                //width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: showAccordion != false ? 10.0 : 0.0),
                child: SlideTransition(
                  position: offset,
                  child: Column(
                    children: widget.children,
                  ),
                ),
              )
            : Container(),
      ],
    );

    /*Column(
              children: <Widget>[
                SizedBox(height: 16),
                Text('Default', style: Theme.of(context).textTheme.title),
                integerInfiniteNumberPicker,
                new RaisedButton(
                  onPressed: () => _showInfIntDialog(),
                  child: new Text("Current int value: $_currentInfIntValue"),
                ),
                Divider(color: Colors.grey, height: 32),
                Text('Decorated', style: Theme.of(context).textTheme.title),
                integerInfiniteDecoratedNumberPicker,
                Text(
                  "Current int value: $_currentInfIntValueDecorated",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )*/
    ;
  }

  showPickerNumberFormatValue(BuildContext context) {
    abc != true
        ? Picker(
            height: 150.0,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            cancelTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            confirmTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            selectedTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            cancelText: 'Выйти',
            confirmText: 'Выбрать',
            adapter: NumberPickerAdapter(data: [
              NumberPickerColumn(
                  begin: 0,
                  end: 23,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
              NumberPickerColumn(
                  begin: 0,
                  end: 59,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
            ]),
            delimiter: [
              PickerDelimiter(
                  child: Container(
                width: 10.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ))
            ],
            hideHeader: true,
            title: Text(
              "Выберите время",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
            onConfirm: (Picker picker, List value) {
              setState(() {
                toTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
                toTimeMinute = (value[1] < 10) ? "0${value[1]}" : "${value[1]}";
                toTime = '$toTimeHour:$toTimeMinute';
                //print(toTime);
              });
            }).showDialog(context)
        : SizedBox();
  }

  showPickerNumberFormatValue2(BuildContext context) {
    abc != true
        ? Picker(
            height: 150.0,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            cancelTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            confirmTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            selectedTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            cancelText: 'Выйти',
            confirmText: 'Выбрать',
            adapter: NumberPickerAdapter(data: [
              NumberPickerColumn(
                  begin: 0,
                  end: 23,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
              NumberPickerColumn(
                  begin: 0,
                  end: 59,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
            ]),
            delimiter: [
              PickerDelimiter(
                  child: Container(
                width: 10.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ))
            ],
            hideHeader: true,
            onConfirm: (Picker picker, List value) {
              setState(() {
                fromTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
                fromTimeMinute = (value[1] < 10) ? "0${value[1]}" : "${value[1]}";
                fromTime = '$fromTimeHour:$fromTimeMinute';
                //  print(fromTime);
              });
            }).showDialog(context)
        : SizedBox();
  }

  @override
  void initState() {
    showAccordion = widget.showAccordion;
    controllerAccordion = AnimationController(duration: Duration(seconds: 2), vsync: this);
    offset = Tween(
      begin: Offset(0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controllerAccordion,
        curve: Curves.elasticIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controllerAccordion.dispose();
    super.dispose();
  }

  getRenderKeySize() {
    RenderBox _renderBox = _renderKey.currentContext.findRenderObject();
    renderKeyHeight11 = _renderBox.size.height;
    renderKeyPosition = _renderBox.localToGlobal(Offset.zero).dy;
    screenSize = MediaQuery.of(context).size.height;
    widget.callback11(renderKeyHeight11);
    print(MediaQuery.of(context).size.height);
    print(renderKeyHeight11);
    print(renderKeyPosition);

    (screenSize - renderKeyPosition) > renderKeyHeight11
        ? SizedBox()
        : Scrollable.ensureVisible(
            _renderKey.currentContext,
            alignment: 0.0,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
            alignmentPolicy: renderKeyHeight11 > screenSize ? ScrollPositionAlignmentPolicy.explicit : ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
          );
  }

  void toggleAccordion() {
    setState(() {
      switch (controllerAccordion.status) {
        case AnimationStatus.completed:
          controllerAccordion.forward(from: 0);
          break;
        case AnimationStatus.dismissed:
          controllerAccordion.forward();
          break;
        default:
      }

      showAccordion = !showAccordion;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => getRenderKeySize());
    widget.callback11(
      renderKeyHeight11,
    );
  }
}
