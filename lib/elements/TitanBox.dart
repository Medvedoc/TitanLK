import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:flutter_image/elements/elements/TitanBoxCheck.dart';
import 'package:flutter_image/elements/elements/TitanBoxIndicator.dart';
import 'package:flutter_image/elements/elements/TitanBoxPicker.dart';
import 'package:flutter_image/elements/elements/TitanBoxTimer.dart';
import 'package:flutter_image/elements/elements/TitanBoxToogle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TitanBox extends StatefulWidget {
  final Function(
    bool,
    String,
    String,
  ) onTap;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final bool toggleable;

  //final VoidCallback onPressed;
  final List<Widget> children;
  final Function(double) callback;
  final Decorations style;
  final TitleString title;
  final SubTitleString subtitle;
  final IconsTheme icon;
  final DialogShow dialog;
  final CounterShow counter;
  final TimerShow timer;
  final PickerShow picker;
  final Type type;
  final bool isChecked;
  bool switched;
  //final bool isSwitched;
  bool switches;
  //Function(bool) callbackswitches;

  TitanBox({
    this.onTap,
    this.value,
    this.groupValue,
    this.onChanged,
    this.toggleable,
    //@required this.onPressed,
    this.children,
    this.callback,
    this.style,
    this.title,
    this.subtitle,
    this.icon,
    this.dialog,
    this.timer,
    this.picker,
    this.counter,
    this.type,
    this.isChecked,
    this.switched = false,
    //this.isSwitched,
    this.switches,
    //this.callbackswitches,
  });

  @override
  State<StatefulWidget> createState() => TitanBoxState();
}

class TitanBoxState extends State<TitanBox> with TickerProviderStateMixin {
  int selectedRadio;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  List<String> time;
  String toTime;
  String fromTime;

  String toTimeHour;
  String toTimeMinute;
  String fromTimeHour;
  String fromTimeMinute;
  bool isSwitched = false;
  bool checked = false;
  double sizeBox;
  int blablabla;
  callbackCheckbox(isChecked) {
    setState(() {
      checked = isChecked;
    });
  }

  bool timer = false;

  callbackTimer(timeCounter) {
    setState(() {
      timer = timeCounter;
    });
  }

  double _iconSize = 24.0;
  double _timerSize = 32.0;
  final GlobalKey _renderKey = GlobalKey();
  double renderKeyHeight;
  double renderKeyPosition;
  double screenSize;
  AnimationController animationController;
  AnimationController controller;
  Animation<Offset> offset;
  bool showAccordion;
  bool accordion;
  bool isTapped = false;
  Color _shadowColor = Color.fromRGBO(118, 106, 2, 1);
  Color _borderColor = Color.fromRGBO(118, 106, 2, 1);
  Color _buttonColor = Color.fromRGBO(118, 106, 2, 1);
  LinearGradient _borderGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(112, 112, 112, 1),
      Color.fromRGBO(243, 243, 243, 1),
      Color.fromRGBO(89, 89, 89, 1),
      Color.fromRGBO(193, 193, 193, 1),
    ],
    stops: [0.0, 0.5, 0.5, 1.0],
  );
  int _counter;
  double _borderRadius = 15.0;
  LinearGradient _linerGradient;

  Widget _buildBackLayout() {
    _borderRadius = widget.style.border != null
        ? widget.style.border.borderRadius
        : _borderRadius;
    return Padding(
      padding: EdgeInsets.only(
          top: widget.type != null && widget.type.type.number == 1
              ? widget.style.tappedWidth
              : 0.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius + _borderRadius / 3)),
            boxShadow: [
              BoxShadow(
                  color: widget.style != null &&
                          widget.style.background != null &&
                          widget.style.background.shadowColor != null
                      ? widget.style.background.shadowColor
                      : _shadowColor)
            ]),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
              width: widget.style.width,
              height: widget.style.height - widget.style.tappedWidth),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    _borderRadius = widget.style.border != null
        ? widget.style.border.borderRadius
        : _borderRadius;
    return Padding(
      padding: EdgeInsets.only(
          top: widget.type != null && widget.type.type.number == 1
              ? (isTapped
                  ? widget.style.tappedWidth - widget.style.tappedOffset
                  : 0.0)
              : 0.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            color: widget.style.border != null
                ? widget.style.border.borderColor
                : _borderColor,
            gradient: widget.style.border != null
                ? widget.style.border.borderGradient
                : _borderGradient,
            borderRadius: BorderRadius.all(Radius.circular(_borderRadius))),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
              width: widget.style.width,
              height: widget.type != null /*&& widget.type.number == 1*/
                  ? widget.style.height - widget.style.tappedWidth
                  : widget.style.height - widget.style.tappedWidth),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 50),
            decoration: widget.style.background.color != null
                ? BoxDecoration(
                    color: widget.style.background.color != null
                        ? widget.style.background.color
                        : _buttonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          _borderRadius - 1.0 - (_borderRadius / 5 / 10)),
                    ),
                  )
                : BoxDecoration(
                    gradient: _linerGradient,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          _borderRadius - 1.0 - (_borderRadius / 5 / 10)),
                    ),
                  ),
            margin: EdgeInsets.only(
                top:
                    widget.style.border != null ? widget.style.border.top : 0.0,
                right: widget.style.border != null
                    ? widget.style.border.right
                    : 0.0,
                bottom: widget.style.border != null
                    ? widget.style.border.bottom
                    : 0.0,
                left: widget.style.border != null
                    ? widget.style.border.left
                    : 0.0),
            alignment: Alignment.center,
            child: Container(
              /*padding: widget.style != null && widget.style.padding != null
                  ? widget.style.padding
                  : EdgeInsets.symmetric(horizontal: 10.0),*/

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _leftBlock(),
                  _textBlock(),
                  _rightBlock(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _leftBlock() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.type != null &&
                widget.type.alignment != null &&
                widget.type.alignment.number == 1
            ? _indicatorBox()
            : SizedBox(),
        widget.type != null &&
                widget.type.alignment != null &&
                widget.type.alignment.number == 1
            ? _checkBox()
            : SizedBox(),
        /*widget.type != null &&
                widget.type.alignment != null &&
                widget.type.alignment.number == 1
            ? _radioBox()
            : SizedBox(),*/
        widget.type != null &&
                widget.type.alignment != null &&
                widget.type.alignment.number == 1
            ? _toogleBox()
            : SizedBox(),
        widget.type != null &&
                widget.type.alignment != null &&
                widget.type.alignment.number == 1
            ? _typeBox()
            : SizedBox(),
        widget.counter != null &&
                widget.counter.alignment != null &&
                widget.counter.alignment.number == 1
            ? _counterBox()
            : SizedBox(),
        widget.icon != null &&
                widget.icon.alignment != null &&
                widget.icon.alignment.number == 1
            ? _icon()
            : SizedBox(),
      ],
    );
  }

  Widget _rightBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        widget.icon != null &&
                    widget.icon.alignment != null &&
                    widget.icon.alignment.number == 4 ||
                widget.icon != null && widget.icon.alignment == null
            ? _icon()
            : SizedBox(),
        widget.counter != null &&
                    widget.counter.alignment != null &&
                    widget.counter.alignment.number == 4 ||
                widget.counter != null && widget.counter.alignment == null
            ? _counterBox()
            : SizedBox(),
        widget.type != null &&
                    widget.type.alignment != null &&
                    widget.type.alignment.number == 2 ||
                widget.type != null && widget.type.alignment == null
            ? _typeBox()
            : SizedBox(),
        widget.type != null &&
                    widget.type.alignment != null &&
                    widget.type.alignment.number == 2 ||
                widget.type != null && widget.type.alignment == null
            ? _checkBox()
            : SizedBox(),
        /*widget.type != null &&
                    widget.type.alignment != null &&
                    widget.type.alignment.number == 2 ||
                widget.type != null && widget.type.alignment == null
            ? _radioBox()
            : SizedBox(),*/
        widget.type != null &&
                    widget.type.alignment != null &&
                    widget.type.alignment.number == 2 ||
                widget.type != null && widget.type.alignment == null
            ? _toogleBox()
            : SizedBox(),
        widget.type != null &&
                    widget.type.alignment != null &&
                    widget.type.alignment.number == 2 ||
                widget.type != null && widget.type.alignment == null
            ? _indicatorBox()
            : SizedBox(),
        widget.timer != null ? _timerBox() : SizedBox(),
      ],
    );
  }

  Widget _textBlock() {
    return Flexible(
      child: Container(
        padding: widget.style.padding != null
            ? widget.style.padding
            : EdgeInsets.symmetric(
                horizontal: widget.title != null || widget.subtitle != null
                    ? 10.0
                    : 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: widget.style.textAlignment != null
              ? widget.style.textAlignment
              : MainAxisAlignment.center,
          children: [
            _leftTextBlock(),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                //padding: EdgeInsets.symmetric(horizontal:10.0),
                //child: Row(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                //  mainAxisAlignment: widget.style.textAlignment != null
                //      ? widget.style.textAlignment
                //      : MainAxisAlignment.center,
                //  children: [
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    widget.title != null
                        ? Text(
                            widget.title.upperCase != null &&
                                    widget.title.upperCase == true
                                ? widget.title.title.toUpperCase()
                                : widget.title.title,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style: widget.title.textStyle != null
                                ? widget.title.textStyle
                                : widget.type !=
                                        null /*&& widget.type.number == 1*/
                                    ? Theme.of(context).textTheme.button.merge(
                                        TextStyle(
                                            color: widget
                                                .style.background.textColor))
                                    : Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .merge(
                                          TextStyle(
                                            color: widget
                                                .style.background.textColor,
                                          ),
                                        ),
                          )
                        : SizedBox(),
                    widget.type != null
                        ? widget.subtitle != null
                            ? Text(
                                widget.subtitle.upperCase != null &&
                                        widget.subtitle.upperCase == true
                                    ? widget.subtitle.subtitle.toUpperCase()
                                    : widget.subtitle.subtitle,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                textAlign: TextAlign.left,
                                style: widget.subtitle.textStyle != null
                                    ? widget.subtitle.textStyle
                                    : Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .merge(
                                          TextStyle(
                                            color: Color.fromRGBO(
                                                110, 110, 110, 1),
                                          ),
                                        ),
                              )
                            : SizedBox()
                        : SizedBox(),
                    //  ],
                    // ),
                    //_pickerBox(),
                  ],
                ),
              ),
            ),
            _pickerBox(),
            _rightTextBlock(),
            widget.dialog != null &&
                        widget.dialog.alignment != null &&
                        widget.dialog.alignment.number == 4 ||
                    widget.dialog != null && widget.dialog.alignment == null
                ? _dialogBox()
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _leftTextBlock() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: widget.style.textAlignment != null
          ? widget.style.textAlignment
          : MainAxisAlignment.center,
      children: [
        widget.counter != null &&
                widget.counter.alignment != null &&
                widget.counter.alignment.number == 2
            ? _counterBox()
            : SizedBox(),
        widget.dialog != null &&
                widget.dialog.alignment != null &&
                widget.dialog.alignment.number == 2
            ? _dialogBox()
            : SizedBox(),
        widget.icon != null &&
                widget.icon.alignment != null &&
                widget.icon.alignment.number == 2
            ? _icon()
            : SizedBox()
      ],
    );
  }

  Widget _rightTextBlock() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: widget.style.textAlignment != null
          ? widget.style.textAlignment
          : MainAxisAlignment.center,
      children: [
        widget.icon != null &&
                widget.icon.alignment != null &&
                widget.icon.alignment.number == 3
            ? _icon()
            : SizedBox(),
        widget.dialog != null &&
                widget.dialog.alignment != null &&
                widget.dialog.alignment.number == 3
            ? _dialogBox()
            : SizedBox(),
        widget.counter != null &&
                widget.counter.alignment != null &&
                widget.counter.alignment.number == 3
            ? _counterBox()
            : SizedBox()
      ],
    );
  }

  Widget _pickerBox() {
    return widget.picker != null
        ? Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: widget.children != null && showAccordion != true ||
                      widget.children == null && showAccordion == true
                  ? 1
                  : 0.2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('до ',
                      style: widget.title.textStyle != null
                          ? widget.title.textStyle
                          : widget.type != null
                              ? Theme.of(context).textTheme.button.merge(
                                  TextStyle(
                                      color: widget.style.background.textColor))
                              : Theme.of(context).textTheme.headline3.merge(
                                    TextStyle(
                                      color: widget.style.background.textColor,
                                    ),

                                    /*  Theme.of(context).textTheme.headline3.merge(TextStyle(
                              color: Color.fromRGBO(
                                  0,
                                  0,
                                  0,
                                  widget.children != null &&
                                              showAccordion != true ||
                                          widget.children == null &&
                                              showAccordion == true
                                      ? 1
                                      : 0.2),
                            )*/
                                  )),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showPickerNumberFormatValue(context, 1);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            width: 1.0, style: BorderStyle.solid),
                      ),
                      child: Text('$toTime',
                          style: widget.title.textStyle != null
                              ? widget.title.textStyle
                              : widget.type != null
                                  ? Theme.of(context).textTheme.button.merge(
                                      TextStyle(
                                          color: widget
                                              .style.background.textColor))
                                  : Theme.of(context).textTheme.headline3.merge(
                                        TextStyle(
                                          color:
                                              widget.style.background.textColor,
                                        ),

                                        /*Theme.of(context)
                              .textTheme
                              .headline3
                              .merge(TextStyle(
                                color: Color.fromRGBO(
                                    0,
                                    0,
                                    0,
                                    widget.children != null &&
                                                showAccordion != true ||
                                            widget.children == null &&
                                                showAccordion == true
                                        ? 1
                                        : 0.2),
                              )*/
                                      )),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'после ',
                    style: widget.title.textStyle != null
                        ? widget.title.textStyle
                        : widget.type != null
                            ? Theme.of(context).textTheme.button.merge(
                                TextStyle(
                                    color: widget.style.background.textColor))
                            : Theme.of(context).textTheme.headline3.merge(
                                  TextStyle(
                                    color: widget.style.background.textColor,
                                  ),
                                  /*Theme.of(context).textTheme.headline3.merge(TextStyle(
                              color: Color.fromRGBO(
                                  0,
                                  0,
                                  0,
                                  widget.children != null &&
                                              showAccordion != true ||
                                          widget.children == null &&
                                              showAccordion == true
                                      ? 1
                                      : 0.2),
                            )*/
                                ),
                  ),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showPickerNumberFormatValue(context, 2);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            width: 1.0, style: BorderStyle.solid),
                      ),
                      child: Text(
                        '$fromTime',
                        style: widget.title.textStyle != null
                            ? widget.title.textStyle
                            : widget.type != null
                                ? Theme.of(context).textTheme.button.merge(
                                    TextStyle(
                                        color:
                                            widget.style.background.textColor))
                                : Theme.of(context).textTheme.headline3.merge(
                                      TextStyle(
                                        color:
                                            widget.style.background.textColor,
                                      ),
                                      /*Theme.of(context).textTheme.bodyText1.merge(
                              TextStyle(
                                color: Color.fromRGBO(
                                    0,
                                    0,
                                    0,
                                    widget.children != null &&
                                                showAccordion != true ||
                                            widget.children == null &&
                                                showAccordion == true
                                        ? 1
                                        : 0.2),
                              ),*/
                                    ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }

  Widget _timerBox() {
    return TimerButton(
      timer: timer,
      callbackTimer: callbackTimer,
      seconds: 6,
      textStyle: widget.timer != null
          ? widget.timer.textStyle
          : Theme.of(context).textTheme.headline1.merge(
                TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
    );
  }

  Widget _indicatorBox() {
    return widget.type != null &&
            widget.type.type != null &&
            widget.type.type.number == 4
        ? Container(
            padding: widget.type.alignment.number == 1
                ? EdgeInsets.only(
                    left: widget.type.type.number == 4 &&
                            widget.type.padding != null
                        ? widget.type.padding
                        : 10.0)
                : EdgeInsets.only(
                    right: widget.type.type.number == 4 &&
                            widget.type.padding != null
                        ? widget.type.padding
                        : 10.0),
            alignment: Alignment.center,
            child: Row(
              children: [
                TitanBoxIndicator(
                  indication: widget.type.indications != null
                      ? widget.type.indications
                      : [false, false, false, false, false, false],
                  indicatorCaunt: widget.type.indicatorCaunt != null
                      ? widget.type.indicatorCaunt
                      : 2,
                  indicatorHeight: widget.type.indicatorHeight != null
                      ? widget.type.indicatorHeight
                      : 20.0,
                  indicatorWidth: widget.type.indicatorWidth != null
                      ? widget.type.indicatorWidth
                      : 20.0,
                  indicatorBackground: widget.type.indicatorBackground != null
                      ? widget.type.indicatorBackground
                      : Colors.transparent,
                  indicatorBorderColorEnabled:
                      widget.type.indicatorBorderColorEnabled != null
                          ? widget.type.indicatorBorderColorEnabled
                          : Color.fromRGBO(39, 174, 96, 1),
                  indicatorBorderColorDisabled:
                      widget.type.indicatorBorderColorDisabled != null
                          ? widget.type.indicatorBorderColorDisabled
                          : Color.fromRGBO(204, 204, 204, 1),
                  indicatorWeight: widget.type.indicatorWeight != null
                      ? widget.type.indicatorWeight
                      : 3.0,
                )
              ],
            ),
          )
        : SizedBox();
  }

  Widget _checkBox() {
    return widget.type != null &&
            widget.type.type != null &&
            widget.type.type.number == 3
        ? Container(
            padding: widget.type.alignment.number == 1
                ? EdgeInsets.only(
                    left: widget.type.type.number == 3 &&
                            widget.type.padding != null
                        ? widget.type.padding
                        : 10.0)
                : EdgeInsets.only(
                    right: widget.type.type.number == 3 &&
                            widget.type.padding != null
                        ? widget.type.padding
                        : 10.0),
            alignment: Alignment.center,
            child: TitanBoxCheck(
              checkboxIcon: widget.type.checkboxIcon != null
                  ? widget.type.checkboxIcon
                  : Icons.check,
              checkboxBorderRadius: widget.type.checkboxBorderRadius != null
                  ? widget.type.checkboxBorderRadius
                  : 2.0,
              checkboxHeight: widget.type.checkboxHeight != null
                  ? widget.type.checkboxHeight
                  : 22.0,
              checkboxWidth: widget.type.checkboxWidth != null
                  ? widget.type.checkboxWidth
                  : 22.0,
              checkboxBorederWidth: widget.type.checkboxBorederWidth != null
                  ? widget.type.checkboxBorederWidth
                  : 1.5,
              checkboxBorderColor: widget.type.checkboxBorderColor != null
                  ? widget.type.checkboxBorderColor
                  : Colors.black,
              checkboxCheckedColor: widget.type.checkboxCheckedColor != null
                  ? widget.type.checkboxCheckedColor
                  : Colors.black,
              checkboxUncheckedColor: widget.type.checkboxUncheckedColor != null
                  ? widget.type.checkboxUncheckedColor
                  : Colors.transparent,
              checkboxIconColor: widget.type.checkboxIconColor != null
                  ? widget.type.checkboxIconColor
                  : Colors.white,
              checkboxIconSize: widget.type.checkboxIconSize != null
                  ? widget.type.checkboxIconSize
                  : 18.0,
              checked: checked,
              callbackCheckbox: callbackCheckbox,
              isChecked11: widget.type.switched == null
                  ? false
                  : widget.type.switched != null
                      ? widget.type.switched
                      : true,
              onTap: (selected) {
                if (widget.onTap != null) {
                  widget.onTap(selected, fromTime, toTime);
                }
                _toggleCollapsed();
                widget.callback(renderKeyHeight);
                //}
              },
            ),
          )
        : SizedBox();
  }

  double paddingToogle;
  double totalpaddingToogle;
  Widget _toogleBox() {
    paddingToogle = widget.type.type.number == 2 && widget.type.padding != null
        ? widget.type.padding
        : 10.0;
    totalpaddingToogle =
        widget.type.toggleWidth != null ? widget.type.toggleWidth : 40.0;
    totalpaddingToogle = totalpaddingToogle + paddingToogle;
    return widget.type != null &&
            widget.type.type != null &&
            widget.type.type.number == 2
        ? Container(
            alignment: Alignment.center,
            padding: widget.type.alignment.number == 1
                ? EdgeInsets.only(left: paddingToogle)
                : EdgeInsets.only(right: paddingToogle),
            child: TitanBoxToogle(
              value: widget.type.switched != null
                  ? isSwitched != widget.type.switched
                  : isSwitched,
              onToggle: (val) {
                setState(() {
                  _toggleCollapsed();

                widget.callback(renderKeyHeight);
                  isSwitched = !isSwitched;

                  if (widget.onTap != null) {
                    widget.onTap(isSwitched, fromTime, toTime);
                  }
                });
              },
              toggleColor: widget.type.toggleColor != null
                  ? widget.type.toggleColor
                  : Colors.white,
              activeColor: widget.type.toggleActiveColor != null
                  ? widget.type.toggleActiveColor
                  : Colors.black,
              inactiveColor: widget.type.toggleInactiveColor != null
                  ? widget.type.toggleInactiveColor
                  : Color.fromRGBO(101, 91, 0, 0.4),
              width: widget.type.toggleWidth != null
                  ? widget.type.toggleWidth
                  : 40.0,
              height: widget.type.toggleHeight != null
                  ? widget.type.toggleHeight
                  : 20.0,
              toggleSize: widget.type.toggleSize != null
                  ? widget.type.toggleSize
                  : 18.0,
              borderRadius: widget.type.toggleBorderRadius != null
                  ? widget.type.toggleBorderRadius
                  : 20.0,
              padding: widget.type.togglePadding != null
                  ? widget.type.togglePadding
                  : 2.0,
            ),
          )
        : SizedBox();
  }

  Widget _icon() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        /*padding: widget.type.alignment.number == 1
            ? EdgeInsets.only(left: 10)
            : EdgeInsets.only(right: 10),*/
        /*padding: widget.icon != null && widget.icon.padding != null
            ? widget.icon.padding
            : EdgeInsets.symmetric(horizontal: 5.0),*/
        child: Icon(
          widget.icon.icons,
          color: widget.style.background.textColor,
          size: _iconSize,
        ),
      ),
    );
  }

  Widget _dialogBox() {
    return widget.dialog != null
        ? GestureDetector(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: widget.dialog != null &&
                        widget.dialog.icon != null &&
                        widget.dialog.icon.background != null
                    ? widget.dialog.icon.background
                    : Color.fromRGBO(254, 229, 0, 1),
                border: Border.all(
                    color: Color.fromRGBO(101, 91, 0, 0.5),
                    width: 2,
                    style: BorderStyle.solid),
                shape: widget.dialog != null &&
                        widget.dialog.icon != null &&
                        widget.dialog.icon.shape != null
                    ? widget.dialog.icon.shape
                    : BoxShape.circle,
              ),
              child: Icon(
                widget.dialog != null &&
                        widget.dialog.icon != null &&
                        widget.dialog.icon.icon != null
                    ? widget.dialog.icon.icon
                    : FontAwesomeIcons.question,
                color: widget.dialog != null &&
                        widget.dialog.icon != null &&
                        widget.dialog.icon.iconColor != null
                    ? widget.dialog.icon.iconColor
                    : Color.fromRGBO(101, 91, 0, 0.5),
                size: widget.dialog != null &&
                        widget.dialog.icon != null &&
                        widget.dialog.icon.iconSize != null
                    ? widget.dialog.icon.iconSize
                    : 20.0,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          widget.dialog.borderRadius != null
                              ? widget.dialog.borderRadius
                              : 30.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: widget.dialog.padding != null
                              ? widget.dialog.padding
                              : EdgeInsets.all(10.0),
                          child: Text(
                              widget.dialog != null ? widget.dialog.title : ''),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )
        : SizedBox();
  }

  Widget _counterBox() {
    return AnimatedOpacity(
      opacity:
          (widget.counter != null ? widget.counter.title : 0) > 0 ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: Container(
        padding: (widget.counter != null ? widget.counter.title : 0) >= 10
            ? EdgeInsets.symmetric(horizontal: 6.5, vertical: 6.5)
            : EdgeInsets.symmetric(horizontal: 10.5, vertical: 6.5),
        decoration: BoxDecoration(
          gradient: widget.counter.gradient != null
              ? widget.counter.gradient
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                  colors: [
                    Color.fromRGBO(116, 106, 18, 1),
                    Color.fromRGBO(144, 126, 90, 1),
                  ],
                  stops: [0.45, 0.5],
                ),
          borderRadius: BorderRadius.circular(
              widget.counter.borderRadius != null
                  ? widget.counter.borderRadius
                  : 28.0),
          border: Border.all(
            color: widget.counter.borderColor != null
                ? widget.counter.borderColor
                : Color.fromRGBO(101, 91, 0, 1),
            width: widget.counter.borderWidth != null
                ? widget.counter.borderWidth
                : 2,
          ),
        ),
        child: Text(
          widget.counter.title.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              .merge(TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _typeBox() {
    return widget.type != null &&
            widget.type.type != null &&
            widget.type.type.number == 1 &&
            widget.children != null
        ? Container(
            padding: widget.type.alignment.number == 1
                ? EdgeInsets.only(left: 5)
                : EdgeInsets.only(right: 5),
            alignment: Alignment.center,
            child: showAccordion
                ? Icon(
                    Icons.keyboard_arrow_up,
                    color: widget.style.background.textColor,
                  )
                : Icon(
                    Icons.keyboard_arrow_down,
                    color: widget.style.background.textColor,
                  ),
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 0.0),
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(_borderRadius)),
                        boxShadow: <BoxShadow>[
                          widget.type.type.number == 1 ||
                                  widget.style.elevation != null &&
                                      widget.style.elevation == true
                              ? BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  blurRadius: 6,
                                  offset: Offset(
                                      0,
                                      (isTapped
                                          ? widget.style.tappedWidth
                                          : 2)),
                                )
                              : BoxShadow(color: Colors.transparent),
                        ],
                      ),
                      child: _buildBackLayout(),
                    ),
                    _buildTopLayout(),
                  ],
                ),
              ],
            ),
            accordion == true
                ? showAccordion
                    ? Container(
                        key: _renderKey,
                        child: SlideTransition(
                          transformHitTests: true,
                          position: offset,
                          child: Column(
                            children: widget.children != null
                                ? widget.children
                                : SizedBox(),
                          ),
                        ),
                      )
                    : SizedBox(
                        key: _renderKey,
                      )
                : SizedBox(
                    key: _renderKey,
                  )
          ],
        ),
      ),
      onTap: widget.type != null &&
              widget.type.type != null &&
              widget.type.type.number == 1
          ? () {
              if (_counter == 1) {
                isTapped = false;
                accordion == true ? isTapped = false : isTapped = true;
                _counter -= 1;
              } else {
                _counter += 1;
                setState(() {
                  isTapped = !isTapped;
                });
              }
              if (widget.onTap != null) {
                widget.onTap(isTapped, fromTime, toTime);
              }
            }
          : () {},
      onTapDown: widget.type != null &&
              widget.type.type != null &&
              widget.type.type.number == 1
          ? (TapDownDetails event) {
              setState(() {
                isTapped = true;

                _linerGradient = LinearGradient(
                  begin: widget.style.background.end != null
                      ? widget.style.background.end
                      : Alignment.bottomCenter,
                  end: widget.style.background.begin != null
                      ? widget.style.background.begin
                      : Alignment.topCenter,
                  colors: widget.style.background.colors != null
                      ? [
                          widget.style.background.colors[2],
                          widget.style.background.colors[2],
                          widget.style.background.colors[3],
                          widget.style.background.colors[3],
                        ]
                      : [
                          Color.fromRGBO(237, 212, 3, 1),
                          Color.fromRGBO(237, 212, 3, 1),
                          Color.fromRGBO(237, 212, 3, 1),
                          Color.fromRGBO(237, 212, 3, 1),
                        ],
                  stops: widget.style.background.stops != null
                      ? widget.style.background.stops
                      : [0.0, 0.2, 0.8, 1.0],
                );
              });
            }
          : (TapDownDetails event) {},
      onTapUp: widget.type != null &&
              widget.type.type != null &&
              widget.type.type.number == 1
          ? (TapUpDetails event) {
              if (accordion == true) {
                setState(() {
                  isTapped = false;

                  _linerGradient = LinearGradient(
                    begin: widget.style.background.begin != null
                        ? widget.style.background.begin
                        : Alignment.topCenter,
                    end: widget.style.background.end != null
                        ? widget.style.background.end
                        : Alignment.bottomCenter,
                    colors: widget.style.background.colors != null
                        ? [
                            widget.style.background.colors[0],
                            widget.style.background.colors[1],
                            widget.style.background.colors[2],
                            widget.style.background.colors[3],
                          ]
                        : [
                            Color.fromRGBO(253, 228, 0, 1),
                            Color.fromRGBO(253, 228, 0, 1),
                            Color.fromRGBO(237, 212, 3, 1),
                            Color.fromRGBO(237, 212, 3, 1),
                          ],
                    stops: widget.style.background.stops != null
                        ? widget.style.background.stops
                        : [0.0, 0.5, 0.5, 1.0],
                  );
                });
                _toggleCollapsed();
              } else {
                Timer(Duration(milliseconds: 1), () {
                  setState(() {
                    isTapped = false;
                    _linerGradient = LinearGradient(
                      begin: widget.style.background.begin != null
                          ? widget.style.background.begin
                          : Alignment.topCenter,
                      end: widget.style.background.end != null
                          ? widget.style.background.end
                          : Alignment.bottomCenter,
                      colors: widget.style.background.colors != null
                          ? [
                              widget.style.background.colors[0],
                              widget.style.background.colors[1],
                              widget.style.background.colors[2],
                              widget.style.background.colors[3],
                            ]
                          : [
                              Color.fromRGBO(253, 228, 0, 1),
                              Color.fromRGBO(253, 228, 0, 1),
                              Color.fromRGBO(237, 212, 3, 1),
                              Color.fromRGBO(237, 212, 3, 1),
                            ],
                      stops: widget.style.background.stops != null
                          ? widget.style.background.stops
                          : [0.0, 0.5, 0.5, 1.0],
                    );
                  });
                });
              }
            }
          : (TapUpDetails event) {},
    );
  }

  @override
  void initState() {
    time = widget.picker != null && widget.picker.time != null
        ? widget.picker.time
        : [
            DateFormat.Hm().format(new DateTime.now()),
            DateFormat.Hm().format(new DateTime.now())
          ];
    toTime = time[0];
    fromTime = time[1];
    selectedRadio = 0;
    isTapped = widget.type != null && widget.type.switched == true
        ? widget.type.switched
        : false;
    widget.children != null && widget.children.length > 0
        ? accordion = true
        : accordion = false;

    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    offset = Tween(
      begin: const Offset(0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticIn,
      ),
    );
    super.initState();

    widget.type.switched == true ? _counter = 1 : _counter = 0;
    _linerGradient = LinearGradient(
      begin: widget.style.background.begin != null
          ? widget.style.background.begin
          : Alignment.topCenter,
      end: widget.style.background.end != null
          ? widget.style.background.end
          : Alignment.bottomCenter,
      colors: widget.style.background.colors != null
          ? [
              widget.style.background.colors[0],
              widget.style.background.colors[1],
              widget.style.background.colors[2],
              widget.style.background.colors[3],
            ]
          : [
              Color.fromRGBO(253, 228, 0, 1),
              Color.fromRGBO(253, 228, 0, 1),
              Color.fromRGBO(237, 212, 3, 1),
              Color.fromRGBO(237, 212, 3, 1),
            ],
      stops: widget.style.background.stops != null
          ? widget.style.background.stops
          : [0.0, 0.5, 0.5, 1.0],
    );

    switch (widget.type.type.number) {
      case 1:
        //print('buttons');
        sizeBox = widget.type != null && widget.type.arrowSize != null
            ? 5.0 + widget.type.arrowSize + 5.0
            : 32.0;
        break;
      case 2:
        // print('toogle');
        sizeBox = widget.type != null && widget.type.toggleWidth != null
            ? 5.0 + widget.type.toggleWidth + 5.0
            : 50.0;
        break;
      case 3:
        //print('checkboxs');
        sizeBox = widget.type != null && widget.type.checkboxWidth != null
            ? 5.0 + widget.type.checkboxWidth + 5.0
            : 32.0;
        break;
      case 4:
        //print('indicators');
        sizeBox = widget.type != null && widget.type.indicatorWidth != null
            ? 5.0 +
                widget.type.indicatorWidth * widget.type.indicatorCaunt +
                5.0
            : 54.0;
        break;
    }

    widget.type != null &&
            widget.type.switched != null &&
            widget.type.type.number != null
        ? showAccordion = widget.picker != null && widget.children != null
            ? widget.picker != null && widget.type.switched == false
                ? true
                : false
            : widget.type.switched
        : showAccordion = false;
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _toggleCollapsed() {
    setState(() {
      switch (controller.status) {
        case AnimationStatus.completed:
          controller.forward(from: 0);
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        default:
      }
      showAccordion = !showAccordion;
      if (widget.style.onToggleCollapsed != null) {
        widget.style.onToggleCollapsed(showAccordion);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => getRenderKeySize());
    if (widget.children != null&&accordion == true)
      
           widget.callback(renderKeyHeight);
  }

  getRenderKeySize() {
    RenderBox _renderBox = _renderKey.currentContext.findRenderObject();
    renderKeyHeight = _renderBox.size.height;
    renderKeyPosition = _renderBox.localToGlobal(Offset.zero).dy;
    screenSize = MediaQuery.of(context).size.height-150.0;
    if (widget.children != null) widget.callback(renderKeyHeight);

    (screenSize - renderKeyPosition) > renderKeyHeight
        ? SizedBox()
        : Scrollable.ensureVisible(
            _renderKey.currentContext,
            alignment: 0.0,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
            alignmentPolicy: renderKeyHeight > screenSize
                ? ScrollPositionAlignmentPolicy.explicit
                : ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
          );
          widget.callback(renderKeyHeight);
  }

  showPickerNumberFormatValue(BuildContext context, int number) {
    widget.children != null && showAccordion != true ||
            widget.children == null && showAccordion == true
        ? TitanBoxPicker(
            containerColor: Colors.yellow,
            height: 100.0,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
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
            title: Text(
              "Выберите время",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
            onConfirm: (TitanBoxPicker picker, List value) {
              setState(() {
                toTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
                toTimeMinute = (value[1] < 10) ? "0${value[1]}" : "${value[1]}";

                fromTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
                fromTimeMinute =
                    (value[1] < 10) ? "0${value[1]}" : "${value[1]}";

                number == 1
                    ? toTime = '$toTimeHour:$toTimeMinute'
                    : fromTime = '$fromTimeHour:$fromTimeMinute';
              });
            }).showDialog(context)
        : SizedBox();
  }
}
