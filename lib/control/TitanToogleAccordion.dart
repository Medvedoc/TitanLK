import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TitanToogleAccordion extends StatefulWidget {
  TitanToogleAccordion({
    this.textDialog,
    this.border,
    this.textHeading,
    this.title,
    this.children,
    this.renderKeyHeight,
    this.callback,
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
  });

  final List<int> border;
  final String textDialog;
  final String textHeading;
  final String title;
  final double renderKeyHeight;
  final Function(double) callback;
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          key: _renderKey,
          // margin: widget.margin ?? const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
              margin: widget.multiAccordion!=true?EdgeInsets.only(top:10.0):EdgeInsets.all(0.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: new BoxDecoration(
                  color: widget.multiAccordion != null
                      ? Color.fromRGBO(233, 200, 45, 1)
                      : (widget.multiAccordion == true
                          ? Color.fromRGBO(233, 200, 45, 1)
                          : Colors.white),
                  border: new Border(
                    top: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      width: widget.border != null
                          ? widget.border[0].toDouble()
                          : 1.0,
                    ),
                    right: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      width: widget.border != null
                          ? widget.border[1].toDouble()
                          : 1.0,
                    ),
                    bottom: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      width: widget.border != null
                          ? widget.border[2].toDouble()
                          : 1.0,
                    ),
                    left: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      width: widget.border != null
                          ? widget.border[3].toDouble()
                          : 1.0,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          widget.textHeading != null ? widget.textHeading : '',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        widget.textDialog != null
                            ? GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: new BoxDecoration(
                                    border: new Border.all(
                                        color: Color.fromRGBO(101, 91, 0, 0.5),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(254, 229, 0, 1),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.question,
                                    color: Color.fromRGBO(101, 91, 0, 0.5),
                                    size: 20.0,
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        elevation: 8,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 16.0),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(
                                                      widget.textDialog != null
                                                          ? widget.textDialog
                                                          : '')),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )
                            : SizedBox(height: 34.0),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlutterSwitch(
                        value: isSwitched,
                        onToggle: (val) {
                          setState(() {
                            toggleAccordion();
                            isSwitched = val;
                          });
                        },
                        activeColor: Colors.black,
                        inactiveColor: Color.fromRGBO(101, 91, 0, 0.4),

                        toggleColor: widget.multiAccordion != null
                            ? Color.fromRGBO(233, 200, 45, 1)
                            : (widget.multiAccordion == true
                                ? Color.fromRGBO(233, 200, 45, 1)
                                : Colors.white),
                        // toggleColor: Color.fromRGBO(233, 200, 45, 1),
                        width: 40.0,
                        height: 20.0,
                        toggleSize: 18.0,
                        valueFontSize: 16.0,
                        borderRadius: 20.0,
                        padding: 2.0,
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
                margin: EdgeInsets.only(bottom:showAccordion!=false? widget.multiAccordion!=null?10.0:0.0:0.0),
                      child: SlideTransition(
                        position: offset,
                        child: Column(
                          children: widget.children,
                        ),
                      ),
                    )
                  : Container(),
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
