import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanIconShadow.dart';
import 'package:icon_shadow/icon_shadow.dart';

class TitanButton2 extends StatefulWidget {
  final TitanControlStyle controlStyle;

  final IconData iconButton;
  final IconData iconTextLeft;
  final IconData iconTextRight;
  final double iconSize;
  final String headButton;
  final bool timer;
  final TextStyle textStyle;
  final EdgeInsets margin;

  final double width;
  final double height;
  final double borderRadius;
  final List<Color> borderColorGradient;
  final List<Color> buttonColorGradient;
  final Color buttonColorBody;
  final List<Color> counterColorGradient;
  final Color counterBorderColor;
  final Color textColor;

  final bool arrowDropbox;
  final bool gradient;
  final Function() pressTap;
  final Function() pressTapDown;
  final Function() pressTapUp;
  final int count;
  final bool variable;
  final Color buttonColor;
  final String types;

  TitanButton2({
    this.controlStyle,
    this.iconButton,
    this.iconSize,
    this.iconTextLeft,
    this.iconTextRight,
    this.headButton,
    this.textStyle,
    this.margin,
    this.timer,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColorGradient,
    this.buttonColorGradient,
    this.buttonColorBody,
    this.counterColorGradient,
    this.counterBorderColor,
    this.arrowDropbox,
    this.gradient,
    this.pressTap,
    this.pressTapDown,
    this.pressTapUp,
    this.count,
    this.variable,
    this.textColor,
    this.buttonColor,
    this.types,
  });

  @override
  _TitanButtonState createState() => _TitanButtonState();
}

class _TitanButtonState extends State<TitanButton2> {
  final GlobalKey _renderKey = GlobalKey();
  double renderWidth;
  Alignment _begin; //Начало градиенто
  Alignment _end; //Окончание градиента
  bool _click; //Событие на клик по кнопке
  EdgeInsets _margin; //Наружные отступы анимации кнопки
  EdgeInsets _padding; //Внутренние отступы анимации кнопки
  IconData _arrow; //Иконка выбранного режима Dropbox
  int _counter = 0; //Переключатель срабатывания Dropbox
  List<Color> _colors; //Цвета градиента
  LinearGradient colors;
  List<double> _stops; //Точки расположения градиента
  List<Color> _typeColoring;
  Color _coloring;
  Color _textColor;
  Color _iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        key: _renderKey,
        width: widget.width != null ? widget.width : renderWidth,
        margin: widget.margin!=null? widget.margin:EdgeInsets.symmetric(
            horizontal: widget.controlStyle.buttonMarginHorizontal),
        child: AnimatedContainer(
          height: widget.height != null
              ? widget.height
              : widget.controlStyle.height,
          duration: Duration(
              milliseconds:
                  ((widget.controlStyle.durationAnimation) / 3).floor()),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: pressTap,
            onTapDown: (value) => pressTapDown(),
            onTapUp: (value) => pressTapUp(),

            //Задаем эффект тени контейнеру кнопки
            child: AnimatedContainer(
              duration: Duration(
                  milliseconds:
                      ((widget.controlStyle.durationAnimation) / 3).floor()),

              height: widget.height != null
                  ? widget.height
                  : widget.controlStyle.height,

              margin: _margin,
              padding: _padding,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: widget.controlStyle.elevationColor,
                    offset: widget.controlStyle.elevationOffset,
                    spreadRadius: widget.controlStyle.elevationSpread,
                    blurRadius: widget.controlStyle.elevationBlur,
                  ),
                ],
                color: widget.buttonColorBody != null
                    ? widget.buttonColorBody
                    : _coloring,
                borderRadius: BorderRadius.vertical(
                  top: widget.borderRadius != null
                      ? Radius.circular((widget.borderRadius))
                      : Radius.circular((widget.controlStyle.borderRadius)),
                  bottom: widget.borderRadius != null
                      ? Radius.circular(widget.borderRadius)
                      : Radius.circular(widget.controlStyle.borderRadius),
                ),
              ),

              //Задаем градиент рамки кнопки
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: widget.controlStyle.borderAlignmentGradient[0],
                    end: widget.controlStyle.borderAlignmentGradient[1],
                    tileMode: TileMode.clamp,
                    colors: widget.borderColorGradient != null
                        ? widget.borderColorGradient
                        : widget.controlStyle.borderColorGradient,
                    stops: widget.controlStyle.borderPointGradient,
                  ),
                  borderRadius: widget.borderRadius != null
                      ? BorderRadius.circular((widget.borderRadius) / 1.65)
                      : BorderRadius.circular(
                          (widget.controlStyle.borderRadius) / 1.65),
                ),

                //Задаем градиент подложки надписи текста кнопки
                child: AnimatedContainer(
                  duration: Duration(
                      milliseconds:
                          ((widget.controlStyle.durationAnimation) / 3)
                              .floor()),

                  height:
                      widget.controlStyle.height - widget.controlStyle.weight,

                  margin: EdgeInsets.all(widget.controlStyle.borderWidth),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: _begin,
                      end: _end,
                      colors: _colors,
                      tileMode: TileMode.clamp,
                      stops: _stops,
                    ),
                    borderRadius: widget.borderRadius != null
                        ? BorderRadius.circular((widget.borderRadius) / 2)
                        : BorderRadius.circular(
                            (widget.controlStyle.borderRadius) / 2),
                  ),

                  //Добавляем содержимое кнопки
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                widget.controlStyle.buttonPaddingHorizontal),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          text: WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: widget.iconButton != null
                                  ? TitanIconShadow(
                                      Icon(
                                        widget.iconButton,
                                        color: _iconColor,
                                        size: 26.0,
                                      ),
                                      showShadow: true,
                                      shadowColor: Colors.black,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                widget.controlStyle.buttonPaddingHorizontal),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Добавляем иконку и надпись текста кнопки
                            Flexible(
                              fit: FlexFit.loose,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    //height: widget.controlStyle.textHeight,
                                    color: widget.textColor != null
                                        ? widget.textColor
                                        : _textColor,
                                    fontFamily: widget.controlStyle.fontFamily,
                                    fontSize: widget.controlStyle.textFontSize,
                                    fontWeight: widget.controlStyle.fontWeight,
                                    fontStyle: widget.controlStyle.fontStyle,
                                    letterSpacing: _click
                                        ? widget.controlStyle.letterSpacingDown
                                        : widget.controlStyle.letterSpacingUp,
                                  ),
                                  children: [
                                    widget.iconTextLeft.runtimeType != Null
                                        ? WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5.0),
                                              child: IconShadowWidget(
                                                Icon(
                                                  widget.iconTextLeft,
                                                  color: _iconColor,
                                                  size: widget.iconSize!=null?widget.iconSize: widget
                                                      .controlStyle.iconSize,
                                                ),
                                                shadowColor: widget
                                                    .controlStyle.iconShadow,
                                                showShadow: widget.controlStyle
                                                    .iconShadowVisible,
                                              ),
                                            ),
                                          )
                                        : WidgetSpan(child: SizedBox()),
                                    TextSpan(
                                      text: (widget.headButton != null
                                          ? widget.headButton.toUpperCase()
                                          : ""),
                                      style: TextStyle(
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 2.0,
                                            color: Colors.grey.shade700,
                                          ),
                                        ],
                                        //height: widget.controlStyle.textHeight,
                                        color: widget.textColor != null
                                            ? widget.textColor
                                            : _textColor,
                                        fontFamily:
                                            widget.controlStyle.fontFamily,
                                        fontSize: widget.textStyle != null
                                            ? widget.textStyle.fontSize
                                            : widget.controlStyle.textFontSize,
                                        fontWeight: widget.textStyle != null
                                            ? widget.textStyle.fontWeight
                                            : widget.controlStyle.fontWeight,
                                        fontStyle:
                                            widget.controlStyle.fontStyle,
                                        letterSpacing: _click
                                            ? widget
                                                .controlStyle.letterSpacingDown
                                            : widget
                                                .controlStyle.letterSpacingUp,
                                      ),
                                    ),
                                    widget.iconTextRight.runtimeType != Null
                                        ? WidgetSpan(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 2.0),
                                              child: IconShadowWidget(
                                                Icon(
                                                  widget.iconTextRight,
                                                  color: _iconColor,
                                                  size: widget.iconSize!=null?widget.iconSize: widget
                                                      .controlStyle.iconSize,
                                                ),
                                                shadowColor: widget
                                                    .controlStyle.iconShadow,
                                                showShadow: widget.controlStyle
                                                    .iconShadowVisible,
                                              ),
                                            ),
                                          )
                                        : WidgetSpan(child: SizedBox()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            widget.timer != null
                                ? Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: TweenAnimationBuilder<Duration>(
                                        duration: Duration(minutes: 3),
                                        tween: Tween(
                                            begin: Duration(minutes: 3),
                                            end: Duration.zero),
                                        onEnd: () {
                                          print('Timer ended');
                                        },
                                        builder: (BuildContext context,
                                            Duration value, Widget child) {
                                          //final minutes = value.inMinutes;
                                          final seconds = value.inSeconds % 60;
                                          String second;
                                          seconds < 10
                                              ? second = '0$seconds'
                                              : second = '$seconds';
                                          return Text(
                                            '$second',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 2.0,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 30),
                                          );
                                        }))
                                : SizedBox(),
                            //Добавляем стрелку для Dropbox
                            widget.arrowDropbox == true
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: _click ? 6.5 : 6.0,
                                        vertical: _click ? 6.5 : 7.0),
                                    child: IconShadowWidget(
                                      Icon(
                                        _arrow,
                                        color: _iconColor,
                                        size: widget.controlStyle.iconSize,
                                      ),
                                      shadowColor:
                                          widget.controlStyle.iconShadow,
                                      showShadow:
                                          widget.controlStyle.iconShadowVisible,
                                    ))
                                : SizedBox(),

                            //Добавляем счетчик
                            widget.count != null
                                ? AnimatedOpacity(
                                    opacity: (widget.count != null
                                                ? widget.count
                                                : 0) >
                                            0
                                        ? 1.0
                                        : 0.0,
                                    duration: Duration(
                                        milliseconds: widget
                                            .controlStyle.durationAnimation),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: _click ? 8.5 : 9.5),
                                      padding: (widget.count != null
                                                  ? widget.count
                                                  : 0) >=
                                              10
                                          ? EdgeInsets.symmetric(
                                              horizontal: _click ? 6.5 : 6.0,
                                              vertical: _click ? 6.5 : 7.0)
                                          : EdgeInsets.symmetric(
                                              horizontal: _click ? 10.5 : 10.0,
                                              vertical: _click ? 6.5 : 7.0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: widget.controlStyle
                                              .counterAlignmentGradient[0],
                                          end: widget.controlStyle
                                              .counterAlignmentGradient[1],
                                          tileMode: TileMode.clamp,
                                          colors: [
                                            widget.controlStyle
                                                .counterColorGradient[0],
                                            widget.controlStyle
                                                .counterColorGradient[0],
                                            widget.controlStyle
                                                .counterColorGradient[1],
                                            widget.controlStyle
                                                .counterColorGradient[1],
                                          ],
                                          stops: widget.controlStyle
                                              .counterPointGradient,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            widget.controlStyle
                                                .counterBorderRadius),
                                        border: Border.all(
                                          color: widget
                                              .controlStyle.counterBorderColor,
                                          width: widget
                                              .controlStyle.counterBorderWidth,
                                        ),
                                      ),
                                      child: Text(
                                        widget.count.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          //height:
                                          //    widget.controlStyle.counterHeight,
                                          color:
                                              widget.controlStyle.counterColor,
                                          fontFamily:
                                              widget.controlStyle.fontFamily,
                                          fontSize: widget
                                              .controlStyle.counterFontSize,
                                          fontWeight:
                                              widget.controlStyle.fontWeight,
                                          fontStyle:
                                              widget.controlStyle.fontStyle,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    switch (widget.types) {
      case 'yellow':
        _typeColoring = widget.controlStyle.buttonColorGradientYellow;
        _coloring = widget.controlStyle.buttonColorBodyYellow;
        _textColor = widget.controlStyle.textColorDark;
        _iconColor = widget.controlStyle.iconColorDark;
        break;
      case 'red':
        _typeColoring = widget.controlStyle.buttonColorGradientRed;
        _coloring = widget.controlStyle.buttonColorBodyRed;
        _textColor = widget.controlStyle.textColorWhite;
        _iconColor = widget.controlStyle.iconColorWhite;
        break;
      case 'grey':
        _typeColoring = widget.controlStyle.buttonColorGradientGray;
        _coloring = widget.controlStyle.buttonColorBodyGray;
        _textColor = widget.controlStyle.textColorDark;
        _iconColor = widget.controlStyle.iconColorDark;
        break;
      default:
        _typeColoring = widget.controlStyle.buttonColorGradient;
        _coloring = widget.controlStyle.buttonColorBody;
        _textColor = widget.controlStyle.textColorDark;
        _iconColor = widget.controlStyle.iconColorDark;
        break;
    }

    _click = false;
    _counter = 0;
    _begin = widget.controlStyle.buttonAlignmentGradient[0];
    _end = widget.controlStyle.buttonAlignmentGradient[1];
    _stops = widget.controlStyle.buttonPointGradient;
    _colors = [
      widget.buttonColorGradient != null
          ? widget.buttonColorGradient[0]
          : _typeColoring[0],
      widget.buttonColorGradient != null
          ? widget.buttonColorGradient[0]
          : _typeColoring[0],
      widget.buttonColorGradient != null
          ? widget.buttonColorGradient[1]
          : _typeColoring[1],
      widget.buttonColorGradient != null
          ? widget.buttonColorGradient[1]
          : _typeColoring[1],
    ];
    _margin = widget.controlStyle.weightAnimation[1];
    _padding = widget.controlStyle.weightAnimation[3];
    _arrow = Icons.arrow_drop_down;

    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    RenderBox _renderBox = _renderKey.currentContext.findRenderObject();
    renderWidth = _renderBox.size.width;
  }

  void pressTapUp() {
    if (widget.pressTapUp != null) {
      widget.pressTapUp();
    }

    if (widget.variable == false) {
      setState(() {
        _click = false;

        _begin = widget.controlStyle.buttonAlignmentGradient[0];
        _end = widget.controlStyle.buttonAlignmentGradient[1];
        _stops = widget.controlStyle.buttonPointGradient;
        _colors = [
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[0]
              : _typeColoring[0],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[0]
              : _typeColoring[0],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
        ];
        _margin = widget.controlStyle.weightAnimation[1];
        _padding = widget.controlStyle.weightAnimation[3];
      });
    } else {
      Timer(Duration(milliseconds: 50), () {
        setState(() {
          _click = false;

          _begin = widget.controlStyle.buttonAlignmentGradient[0];
          _end = widget.controlStyle.buttonAlignmentGradient[1];
          _stops = widget.controlStyle.buttonPointGradient;
          _colors = [
            widget.buttonColorGradient != null
                ? widget.buttonColorGradient[0]
                : _typeColoring[0],
            widget.buttonColorGradient != null
                ? widget.buttonColorGradient[0]
                : _typeColoring[0],
            widget.buttonColorGradient != null
                ? widget.buttonColorGradient[1]
                : _typeColoring[1],
            widget.buttonColorGradient != null
                ? widget.buttonColorGradient[1]
                : _typeColoring[1],
          ];
          _margin = widget.controlStyle.weightAnimation[1];
          _padding = widget.controlStyle.weightAnimation[3];
        });
      });
    }
  }

  void pressTapDown() {
    if (widget.pressTapDown != null) {
      widget.pressTapDown();
    }
    setState(() {
      _click = true;

      _begin = widget.controlStyle.buttonAlignmentGradient[1];
      _end = widget.controlStyle.buttonAlignmentGradient[0];
      _stops = widget.controlStyle.buttonPointGradient;
      _colors = [
        widget.buttonColorGradient != null
            ? widget.buttonColorGradient[1]
            : _typeColoring[1],
        widget.buttonColorGradient != null
            ? widget.buttonColorGradient[1]
            : _typeColoring[1],
        widget.buttonColorGradient != null
            ? widget.buttonColorGradient[1]
            : _typeColoring[1],
        widget.buttonColorGradient != null
            ? widget.buttonColorGradient[1]
            : _typeColoring[1],
      ];
      _margin = widget.controlStyle.weightAnimation[0];
      _padding = widget.controlStyle.weightAnimation[2];
      pressTapUp();
    });
  }

  void pressTap() {
    if (widget.pressTap != null) {
      widget.pressTap();
      if (_counter == 0) {
        _click = false;

        _begin = widget.controlStyle.buttonAlignmentGradient[1];
        _end = widget.controlStyle.buttonAlignmentGradient[0];
        _stops = widget.controlStyle.buttonPointGradient;
        _colors = [
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
        ];
        _margin = widget.controlStyle.weightAnimation[0];
        _padding = widget.controlStyle.weightAnimation[2];
        _arrow = Icons.arrow_drop_up;
        _counter += 1;
      } else {
        _click = !_click;

        _begin = widget.controlStyle.buttonAlignmentGradient[0];
        _end = widget.controlStyle.buttonAlignmentGradient[1];
        _stops = widget.controlStyle.buttonPointGradient;
        _colors = [
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[0]
              : _typeColoring[0],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[0]
              : _typeColoring[0],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
          widget.buttonColorGradient != null
              ? widget.buttonColorGradient[1]
              : _typeColoring[1],
        ];
        _margin = widget.controlStyle.weightAnimation[0];
        _padding = widget.controlStyle.weightAnimation[3];
        _arrow = Icons.arrow_drop_down;
        _counter -= 1;
      }
    }
  }
}
