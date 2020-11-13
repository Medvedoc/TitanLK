import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TitanToogleAccordion extends StatefulWidget {
  TitanToogleAccordion({
    this.controlStyle,
    this.background,
    this.border,
    this.textHeading,
    this.textDialog,
    this.margin,
    this.padding,
    this.isSwitched,
    this.multiAccordion,
    this.textStyle,
    this.title,
    this.children,
    this.renderKeyHeight,
    this.callback,
    this.showAccordion = false,
  });
  final TitanControlStyle controlStyle;
  final Color background;
  final Border border;
  final String textHeading;
  final String textDialog;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isSwitched;
  final bool multiAccordion;
  final TextStyle textStyle;

  final String title;
  final double renderKeyHeight;
  final Function(double) callback;
  final List<Widget> children;
  final bool showAccordion;

  @override
  _TitanToogleAccordionState createState() => _TitanToogleAccordionState();
}

class _TitanToogleAccordionState extends State<TitanToogleAccordion>
    with TickerProviderStateMixin {
  final GlobalKey _renderKey = GlobalKey();
  double renderKeyHeight;
  double renderKeyPosition;
  double screenSize;

  AnimationController controllerAccordion;
  Animation<Offset> offset;
  bool showAccordion;
  bool isSwitched = false;
  Border borderAll = Borderic.all();
  EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0);
  EdgeInsets _margin = EdgeInsets.symmetric(horizontal: 0.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: widget.padding != null ? widget.padding : _padding,
                margin: widget.margin != null ? widget.margin : _margin,
                decoration: BoxDecoration(
                  color: widget.background != null
                      ? widget.background
                      : Colors.white,
                  border: widget.border != null ? widget.border : borderAll,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 4,
                          child: Text(
                            widget.textHeading != null
                                ? widget.textHeading
                                : '',
                            style: Theme.of(context).textTheme.bodyText1,
                            softWrap: true,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: widget.textDialog != null
                              ? GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: widget.controlStyle.marginDialog,
                                    padding: widget.controlStyle.paddingDialog,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: widget
                                              .controlStyle.borderColorDialog,
                                          width: widget
                                              .controlStyle.borderWidthDialog,
                                          style: BorderStyle.solid),
                                      shape: BoxShape.circle,
                                      color: widget
                                          .controlStyle.borderColorIconDialog,
                                    ),
                                    child: Icon(
                                      widget.controlStyle.iconDialog,
                                      color:
                                          widget.controlStyle.iconColorDialog,
                                      size: widget.controlStyle.sizeIconDialog,
                                    ),
                                  ),

                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: widget.controlStyle
                                                .borderRadiusWindowDialog,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                padding: widget.controlStyle
                                                    .paddingWindowDialog,
                                                child: Text(
                                                    widget.textDialog != null
                                                        ? widget.textDialog
                                                        : ''),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                )
                              : SizedBox(height: 34.0),
                        ),
                        Flexible(flex: 1, child: SizedBox()),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlutterSwitch(
                        value: widget.isSwitched != null
                            ? isSwitched != widget.isSwitched
                            : isSwitched,
                        onToggle: (val) {
                          setState(() {
                            if (widget.isSwitched == null) {
                              toggleAccordion();
                            }
                            isSwitched = !isSwitched;
                          });
                        },
                        toggleColor: widget.background != null
                            ? widget.background
                            : Colors.white,
                        activeColor: Colors.black,
                        inactiveColor: Color.fromRGBO(101, 91, 0, 0.4),
                        width: 40.0,
                        height: 20.0,
                        toggleSize: 18.0,
                        borderRadius: 20.0,
                        padding: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              widget.multiAccordion != null && widget.multiAccordion == true
                  ? showAccordion
                      ? Container(
                          key: _renderKey,
                          child: SlideTransition(
                            position: offset,
                            child: Column(
                              children: widget.children,
                            ),
                          ),
                        )
                      : Container(
                          key: _renderKey,
                        )
                  : Container(
                      key: _renderKey,
                    ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    showAccordion = widget.showAccordion;
    controllerAccordion =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
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
    renderKeyHeight = _renderBox.size.height;
    renderKeyPosition = _renderBox.localToGlobal(Offset.zero).dy;
    screenSize = MediaQuery.of(context).size.height;
    widget.callback(renderKeyHeight);

    (screenSize - renderKeyPosition) > renderKeyHeight
        ? SizedBox()
        : Scrollable.ensureVisible(
            _renderKey.currentContext,
            alignment: 10.0,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
            alignmentPolicy: renderKeyHeight > screenSize
                ? ScrollPositionAlignmentPolicy.explicit
                : ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
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
    widget.callback(
      renderKeyHeight,
    );
  }
}
