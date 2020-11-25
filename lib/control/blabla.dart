/*library button3d;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Button3dStyle {
  final Color buttonColor;
  final Color backColor;
  final double borderRadius;
  final double borderWidth;
  final double tappedHeight;
  final double tappedOffset;
  final ColorTheme gradient;
  const Button3dStyle({
    this.buttonColor = const Color(0xFF45484c),
    this.backColor = const Color(0xFF191a1c),
    this.borderRadius = 15.0,
    this.borderWidth = 5.0,
    this.tappedHeight = 2.0,
    this.tappedOffset = 0.0,
    this.gradient,
  });
}

class ColorTheme {
  final Color color;
  final LinearGradient linearGradient;
  ColorTheme({
    this.color,
    this.linearGradient,
  });

  static ColorTheme red = ColorTheme(color: Colors.red);

  static ColorTheme _gradients(LinearGradient linearGradient) => ColorTheme(
        linearGradient: linearGradient,
      );

  static ColorTheme gradients({
    LinearGradient linearGradient,
  }) {
    return _gradients(linearGradient);
  }

  static ColorTheme _colors(Color color) => ColorTheme(color: color);

  static ColorTheme colorS({Color color}) {
    return _colors(color);
  }
}

class Button3d extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Button3dStyle style;
  final double width;
  final double height;
  final double margin;
  final double padding;

  Button3d({
    @required this.onPressed,
    this.child,
    this.style,
    this.width,
    this.height = 72.0,
    this.margin,
    this.padding,
  });

  @override
  State<StatefulWidget> createState() => Button3dState();
}

class Button3dState extends State<Button3d> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Padding(
      padding: EdgeInsets.only(top: widget.style.tappedHeight),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          //color: Color.fromRGBO(118, 106, 2, 1),
          borderRadius: BorderRadius.all(Radius.circular(
              widget.style.borderRadius + widget.style.borderRadius / 3)),
          boxShadow: [BoxShadow(color: widget.style.backColor)],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
              width: widget.width,
              height: widget.height - widget.style.tappedHeight),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Container(
      //margin: EdgeInsets.all(widget.style.borderWidth),
      child: Padding(
        padding: EdgeInsets.only(
          top: isTapped
              ? widget.style.tappedHeight - widget.style.tappedOffset
              : 0.0,
        ),
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(widget.style.borderRadius - 3.0)),
            // boxShadow: [BoxShadow(color: widget.style.buttonColor)],
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(112, 112, 112, 1),
                Color.fromRGBO(243, 243, 243, 1),
                Color.fromRGBO(89, 89, 89, 1),
                Color.fromRGBO(193, 193, 193, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: [0.0, 0.5, 0.5, 1.0],
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(
              width: widget.width,
              height: widget.height -
                  widget.style.tappedHeight -
                  widget.style.borderWidth,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.style.borderRadius - 3.0)),
                boxShadow: [BoxShadow(color: widget.style.buttonColor)],
                color: widget.style.gradient.color,
                gradient: widget.style.gradient.linearGradient,
              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.all(widget.style.borderWidth),
              alignment: Alignment.center,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[_buildBackLayout(), _buildTopLayout()],
      ),
      onTapDown: (TapDownDetails event) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (TapUpDetails event) {
        setState(() {
          isTapped = false;
        });
        widget.onPressed();
      },
    );
  }
}*/

library button3d;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Decorations {
  final ColorTheme background;
  final BorderTheme border;
  final double width;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;
  final double borderWeight;
  final double tappedWidth;
  final double tappedOffset;
  final MainAxisAlignment textAlignment;
  final bool showAccordion;
  final Function(bool) onToggleCollapsed;

  const Decorations({
    this.background,
    this.border,
    this.width,
    this.height = 54.0,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
    this.borderRadius = 15.0,
    this.borderWeight = 3.5,
    this.tappedWidth = 6.0,
    this.tappedOffset = 0.0,
    this.textAlignment,
    this.showAccordion = false,
    this.onToggleCollapsed,
  });
}

class TitleString {
  final String title;
  final TextStyle textStyle;
  final bool upperCase;

  const TitleString({
    this.title,
    this.textStyle,
    this.upperCase,
  });
}

class SubTitleString {
  final String subtitle;
  final TextStyle textStyle;
  final bool upperCase;

  const SubTitleString({
    this.subtitle,
    this.textStyle,
    this.upperCase,
  });
}

class DialogShow {
  final String title;
  final EdgeInsets padding;
  final double borderRadius;
  final IconDialogShow icon;
  DialogShow({
    this.title,
    this.padding,
    this.borderRadius,
    this.icon,
  });
}

class IconDialogShow {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxShape shape;
  final double borderWidth;
  final Color borderColor;
  final Color background;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  IconDialogShow({
    this.margin,
    this.padding,
    this.shape,
    this.borderWidth,
    this.borderColor,
    this.background,
    this.icon,
    this.iconColor,
    this.iconSize,
  });
}

class TitanButtonCustom1 extends StatefulWidget {
  final VoidCallback onPressed;
  final List<Widget> children;
  final Function(double) callback;
  final Decorations style;
  final TitleString title;
  final SubTitleString subtitle;
  final IconsTheme icon;
  final DialogShow dialog;
  final Type type;
  final int tapped;

  TitanButtonCustom1({
    @required this.onPressed,
    this.children,
    this.callback,
    this.style,
    this.title,
    this.subtitle,
    this.icon,
    this.dialog,
    this.type,
    this.tapped,
  });

  @override
  State<StatefulWidget> createState() => TitanButtonCustomState();
}

class TitanButtonCustomState extends State<TitanButtonCustom1>
    with TickerProviderStateMixin {
  double _iconSize = 24.0;
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
          /*top: widget.style.tapped != null &&
                  widget.style.tapped == true
              ? widget.style.tappedWidth
              : 0.0),*/

          top: widget.type != null && widget.type.number == 1
              ? widget.style.tappedWidth
              : 0.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius + _borderRadius / 3)),
            boxShadow: [
              BoxShadow(
                  color: widget.style.background != null
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
          top:
              /*widget.style.tapped != null &&
                  widget.style.tapped == true
              ?*/
              widget.type != null && widget.type.number == 1
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
              height:
                  /* widget.style.tapped != null &&
                      widget.style.tapped == true
                  ?*/
                  widget.type != null && widget.type.number == 1
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
                      Radius.circular(_borderRadius - _borderRadius / 5),
                    ),
                  )
                : BoxDecoration(
                    gradient: _linerGradient,
                    borderRadius: BorderRadius.all(
                      Radius.circular(_borderRadius - _borderRadius / 5),
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
              padding: widget.style.padding,
              child: Stack(
                children: [
                  widget.title != null &&
                          widget.icon != null &&
                          widget.icon.iconAlignment.number == 1
                      ? Container(
                          padding: widget.icon != null&& widget.icon.padding != null
                              ? widget.icon.padding
                              : EdgeInsets.symmetric(horizontal: 5.0),
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            widget.icon.icon,
                            color: widget.style.background.textColor,
                            size: _iconSize,
                          ),
                        )
                      : SizedBox(),
                  Container(
                    margin: EdgeInsets.only(
                      left: widget.icon != null
                          ? widget.icon.iconAlignment.number == 1 ||
                                  widget.icon.iconAlignment.number == 2
                              ? _iconSize
                              : 0.0
                          : 0.0,
                      right: widget.icon != null
                          ? widget.icon.iconAlignment.number == 3 ||
                                  widget.icon.iconAlignment.number == 4
                              ? _iconSize
                              : 0.0
                          : 0.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                                  widget.style.textAlignment != null
                                      ? widget.style.textAlignment
                                      : MainAxisAlignment.center,
                              children: [
                                widget.title != null &&
                                        widget.icon != null &&
                                        widget.icon.iconAlignment.number == 2
                                    ? Container(
                                        padding:widget.icon != null&& widget.icon.padding != null
                                            ? widget.icon.padding
                                            : EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                        child: Icon(
                                          widget.icon.icon,
                                          color:
                                              widget.style.background.textColor,
                                          size: _iconSize,
                                        ),
                                      )
                                    : SizedBox(),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Column(
                                    //key: _iconWidth04,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      widget.title != null
                                          ? Text(
                                              widget.title.upperCase != null &&
                                                      widget.title.upperCase ==
                                                          true
                                                  ? widget.title.title
                                                      .toUpperCase()
                                                  : widget.title.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                              style: widget.title.textStyle !=
                                                      null
                                                  ? widget.title.textStyle
                                                  : widget.type != null &&
                                                          widget.type.number ==
                                                              1
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .button
                                                          .merge(TextStyle(
                                                              color: widget
                                                                  .style
                                                                  .background
                                                                  .textColor))
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .headline3
                                                          .merge(
                                                              TextStyle(color: widget.style.background.textColor)))
                                          : SizedBox(),
                                      widget.type != null &&
                                              widget.type.number != 1
                                          ? widget.subtitle != null
                                              ? Text(
                                                  widget.subtitle.upperCase != null &&
                                                          widget.subtitle
                                                                  .upperCase ==
                                                              true
                                                      ? widget.subtitle.subtitle
                                                          .toUpperCase()
                                                      : widget
                                                          .subtitle.subtitle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.fade,
                                                  softWrap: false,
                                                  style: widget.subtitle
                                                              .textStyle !=
                                                          null
                                                      ? widget
                                                          .subtitle.textStyle
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .headline4
                                                          .merge(
                                                            TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      110,
                                                                      110,
                                                                      110,
                                                                      1),
                                                            ),
                                                          ),
                                                )
                                              : SizedBox()
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                                widget.title != null &&
                                        widget.icon != null &&
                                        widget.icon.iconAlignment.number == 3
                                    ? Container(
                                        padding: widget.icon != null&& widget.icon.padding != null
                                            ? widget.icon.padding
                                            : EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                        child: Icon(
                                          widget.icon.icon,
                                          color:
                                              widget.style.background.textColor,
                                          size: _iconSize,
                                        ),
                                      )
                                    : SizedBox(),
                                /*Container(
                                  width: 30.0,
                                  child: FlatButton(
                                    minWidth: 20.0,
                                    onPressed: () {},
                                    child: Icon(Icons.ac_unit),
                                    padding: EdgeInsets.zero,
                                    //key: _iconWidth03,
                                  ),
                                ),*/
                                widget.dialog != null
                                    ? GestureDetector(
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(left: 10.0),
                                          padding: EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: widget.dialog != null &&
                                                    widget.dialog.icon !=
                                                        null &&
                                                    widget.dialog.icon
                                                            .background !=
                                                        null
                                                ? widget.dialog.icon.background
                                                : Color.fromRGBO(
                                                    254, 229, 0, 1),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    101, 91, 0, 0.5),
                                                width: 2,
                                                style: BorderStyle.solid),
                                            shape: widget.dialog != null &&
                                                    widget.dialog.icon !=
                                                        null &&
                                                    widget.dialog.icon.shape !=
                                                        null
                                                ? widget.dialog.icon.shape
                                                : BoxShape.circle,
                                          ),
                                          child: Icon(
                                            widget.dialog != null &&
                                                    widget.dialog.icon !=
                                                        null &&
                                                    widget.dialog.icon.icon !=
                                                        null
                                                ? widget.dialog.icon.icon
                                                : FontAwesomeIcons.question,
                                            color: widget.dialog != null &&
                                                    widget.dialog.icon !=
                                                        null &&
                                                    widget.dialog.icon
                                                            .iconColor !=
                                                        null
                                                ? widget.dialog.icon.iconColor
                                                : Color.fromRGBO(
                                                    101, 91, 0, 0.5),
                                            size: widget.dialog != null &&
                                                    widget.dialog.icon !=
                                                        null &&
                                                    widget.dialog.icon
                                                            .iconSize !=
                                                        null
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
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(widget
                                                                  .dialog
                                                                  .borderRadius !=
                                                              null
                                                          ? widget.dialog
                                                              .borderRadius
                                                          : 30.0)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: widget.dialog
                                                                  .padding !=
                                                              null
                                                          ? widget
                                                              .dialog.padding
                                                          : EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                          widget.dialog != null
                                                              ? widget
                                                                  .dialog.title
                                                              : ''),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.title != null &&
                          widget.icon != null &&
                          widget.icon.iconAlignment.number == 4
                      ? Container(
                          padding: widget.icon != null&& widget.icon.padding != null
                              ? widget.icon.padding
                              : EdgeInsets.symmetric(horizontal: 5.0),
                          alignment: Alignment.centerRight,
                          child: Icon(
                            widget.icon.icon,
                            color: widget.style.background.textColor,
                            size: _iconSize,
                          ),
                        )
                      : SizedBox(),
                  widget.children != null
                      ? Container(
                          padding: widget.icon != null&& widget.icon.padding != null
                              ? widget.icon.padding
                              : EdgeInsets.all(0.0),
                          alignment: Alignment.centerRight,
                          child: showAccordion
                              ? Icon(
                                  Icons.keyboard_arrow_up,
                                  color: widget.style.background.textColor,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_down,
                                  color: widget.style.background.textColor,
                                ))
                      : SizedBox()

                  /*Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.ac_unit),
                ),
                
                Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.ac_unit),
                ),
              FlatButton(
                child: Icon(Icons.aspect_ratio),
                onPressed: () {},
              ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    _buildBackLayout(),
                    _buildTopLayout(),
                  ],
                ),
              ],
            ),
            /*widget.style.accordion != null &&
                    widget.style.accordion == true*/
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
      onTap: () {
        
        if (_counter == 1) {
          isTapped = false;
          //widget.style.accordion == true

          accordion == true ? isTapped = false : isTapped = true;
          _counter -= 1;
          print(_counter);
        } else {
          _counter += 1;
          print(_counter);
          setState(() {
            isTapped = !isTapped;
          });
        }
      },
      onTapDown: (TapDownDetails event) {
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
        //_toggleCollapsed();
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (TapUpDetails event) {
        if (/*widget.style.accordion == true*/
            accordion == true) {
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
          widget.onPressed();
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
      },
    );
  }

  @override
  void initState() {
    widget.children != null && widget.children.length > 0
        ? accordion = true
        : accordion = false;
    showAccordion = widget.style.showAccordion;
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
  _counter = 0;
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

    /*widget.style.accordion != null &&
            widget.style.accordion == true*/

    accordion == true ? widget.callback(renderKeyHeight) : widget.callback(0.0);
  }

  getRenderKeySize() {
    RenderBox _renderBox = _renderKey.currentContext.findRenderObject();
    renderKeyHeight = _renderBox.size.height;
    renderKeyPosition = _renderBox.localToGlobal(Offset.zero).dy;
    screenSize = MediaQuery.of(context).size.height;
    widget.callback(renderKeyHeight);

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
  }
}

class ColorTheme {
  final Color textColor;
  final Color color;
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;
  final List<double> stops;
  final Color shadowColor;
  ColorTheme({
    this.textColor,
    this.color,
    this.begin,
    this.end,
    this.colors,
    this.stops,
    this.shadowColor,
  });

  static ColorTheme yellow = ColorTheme(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(237, 212, 3, 1),
      Color.fromRGBO(237, 212, 3, 1),
    ],
    stops: [0.0, 0.5, 0.5, 1.0],
    shadowColor: Color.fromRGBO(118, 106, 2, 1),
    textColor: Colors.black,
  );

  static ColorTheme red = ColorTheme(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(208, 5, 5, 1),
      Color.fromRGBO(208, 5, 5, 1),
    ],
    stops: [0.0, 0.5, 0.5, 1.0],
    shadowColor: Color.fromRGBO(143, 0, 0, 1),
    textColor: Colors.white,
  );
  static ColorTheme grey = ColorTheme(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(241, 241, 241, 1),
      Color.fromRGBO(241, 241, 241, 1),
      Color.fromRGBO(222, 222, 222, 1),
      Color.fromRGBO(222, 222, 222, 1),
    ],
    stops: [0.0, 0.5, 0.5, 1.0],
    shadowColor: Color.fromRGBO(110, 110, 110, 1),
    textColor: Colors.black,
  );

  static ColorTheme _gradients(
    Color textColor,
    Alignment begin,
    Alignment end,
    List<Color> colors,
    List<double> stops,
    Color shadowColor,
  ) =>
      ColorTheme(
        textColor: textColor,
        begin: begin,
        end: end,
        colors: colors,
        stops: stops,
        shadowColor: shadowColor,
      );

  static ColorTheme gradients({
    Color textColor,
    Alignment begin,
    Alignment end,
    List<Color> colors,
    List<double> stops,
    Color shadowColor,
  }) {
    return _gradients(
      textColor,
      begin,
      end,
      colors,
      stops,
      shadowColor,
    );
  }

  static ColorTheme _coloris(
    Color textColor,
    Color color,
    Color shadowColor,
  ) =>
      ColorTheme(
        textColor: textColor,
        color: color,
        shadowColor: shadowColor,
      );

  static ColorTheme coloris({
    Color textColor,
    Color color,
    Color shadowColor,
  }) {
    return _coloris(
      textColor,
      color,
      shadowColor,
    );
  }
}

class BorderTheme {
  final Color borderColor;
  final LinearGradient borderGradient;
  final double top;
  final double right;
  final double bottom;
  final double left;
  final double borderRadius;
  BorderTheme({
    this.borderColor,
    this.borderGradient,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.borderRadius,
  });

  static BorderTheme button = BorderTheme(
    borderGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(112, 112, 112, 1),
        Color.fromRGBO(243, 243, 243, 1),
        Color.fromRGBO(89, 89, 89, 1),
        Color.fromRGBO(193, 193, 193, 1),
      ],
      stops: [0.0, 0.5, 0.5, 1.0],
    ),
    top: 3.0,
    right: 3.0,
    bottom: 3.0,
    left: 3.0,
    borderRadius: 15.0,
  );

  static BorderTheme all = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 1.0,
    bottom: 1.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme zero = BorderTheme(
    borderColor: Colors.black,
    top: 0.0,
    right: 0.0,
    bottom: 0.0,
    left: 0.0,
    borderRadius: 0.0,
  );

  static BorderTheme trbz = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 1.0,
    bottom: 1.0,
    left: 0.0,
    borderRadius: 0.0,
  );

  static BorderTheme zrbl = BorderTheme(
    borderColor: Colors.black,
    top: 0.0,
    right: 1.0,
    bottom: 1.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme tzbl = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 0.0,
    bottom: 1.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme trzl = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 1.0,
    bottom: 0.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme _gradients(
    LinearGradient borderGradient,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  ) =>
      BorderTheme(
        borderGradient: borderGradient,
        top: top,
        right: right,
        bottom: bottom,
        left: left,
        borderRadius: borderRadius,
      );

  static BorderTheme gradients({
    LinearGradient borderGradient,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  }) {
    return _gradients(
      borderGradient,
      top,
      right,
      bottom,
      left,
      borderRadius,
    );
  }

  static BorderTheme _colors(
    Color borderColor,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  ) =>
      BorderTheme(
        borderColor: borderColor,
        top: top,
        right: right,
        bottom: bottom,
        left: left,
        borderRadius: borderRadius,
      );

  static BorderTheme colors({
    Color borderColor,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  }) {
    return _colors(
      borderColor,
      top,
      right,
      bottom,
      left,
      borderRadius,
    );
  }
}

class Type {
  final int number;
  Type({this.number});

  static Type button = Type(number: 1);
  static Type container = Type(number: 2);
}

class IconAlignment {
  final int number;
  IconAlignment({this.number});

  static IconAlignment leftblock = IconAlignment(number: 1);
  static IconAlignment lefttext = IconAlignment(number: 2);
  static IconAlignment righttext = IconAlignment(number: 3);
  static IconAlignment rightblock = IconAlignment(number: 4);
}

class IconsTheme {
  final IconData icon;
  final EdgeInsets padding;
  final IconAlignment iconAlignment;
  IconsTheme({
    this.icon,
    this.padding,
    this.iconAlignment,
  });
}
