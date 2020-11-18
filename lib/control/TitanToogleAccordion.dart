import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanCheckbox.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TitanToogleAccordion extends StatefulWidget {
  TitanToogleAccordion({
    this.borderRadius,
    this.labels,
    this.picked,
    this.controlStyle,
    this.background,
    this.border,
    this.textHeading,
    this.textsubHeading,
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
    this.isChecked,
    this.types,
    this.group,
    this.value,
    this.aaa,
    this.callbackaaa,
    this.onChanged,
    this.radioChecked,
    this.childok,
    this.indication,
    this.textAlign,
  });
  final double borderRadius;
  final bool radioChecked;
  final bool aaa;
  final Function(int) callbackaaa;
  final TitanControlStyle controlStyle;
  final Color background;
  final Border border;
  final String textHeading;
  final String textsubHeading;
  final String textDialog;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isSwitched;
  final bool multiAccordion;
  final TextStyle textStyle;
  final bool isChecked;

  final String title;
  final double renderKeyHeight;
  final Function(double) callback;
  final List<Widget> children;
  final bool showAccordion;
  final String types;
  final int value;
  final int group;
  final Function(int) onChanged;
  final String picked;
  final List<String> labels;
  final List<Widget> childok;
  final List<bool> indication;
  final AlignmentDirectional textAlign;

  @override
  _TitanToogleAccordionState createState() => _TitanToogleAccordionState();
}

class _TitanToogleAccordionState extends State<TitanToogleAccordion>
    with TickerProviderStateMixin {
  int groupValue_1 = 0;

  int groupValue_2 = 0;

  int selectedRadio;

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

  bool abc = false;

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

  String picked;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: widget.padding != null ? widget.padding : _padding,
          margin: widget.margin != null ? widget.margin : _margin,
          decoration: BoxDecoration(
            color: widget.background != null ? widget.background : Colors.white,
            border: widget.border != null ? widget.border : borderAll,
            borderRadius: widget.borderRadius != null
                ? BorderRadius.all(Radius.circular(widget.borderRadius))
                : null,
          ),
          child: Stack(
            alignment: widget.textAlign != null
                ? widget.textAlign
                : AlignmentDirectional.centerStart,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.textHeading != null ? widget.textHeading : '',
                          style: widget.textStyle != null
                              ? widget.textStyle
                              : Theme.of(context).textTheme.headline2,
                          softWrap: true,
                          //textAlign: TextAlign.center,
                        ),
                        widget.textsubHeading != null
                            ? SizedBox(height: 2.0)
                            : SizedBox(),
                        widget.textsubHeading != null
                            ? Text(
                                widget.textsubHeading != null
                                    ? widget.textsubHeading
                                    : '',
                                style: Theme.of(context).textTheme.headline3,
                                softWrap: true,
                              )
                            : SizedBox(),
                      ],
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
                                    color:
                                        widget.controlStyle.borderColorDialog,
                                    width:
                                        widget.controlStyle.borderWidthDialog,
                                    style: BorderStyle.solid),
                                shape: BoxShape.circle,
                                color:
                                    widget.controlStyle.borderColorIconDialog,
                              ),
                              child: Icon(
                                widget.controlStyle.iconDialog,
                                color: widget.controlStyle.iconColorDialog,
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
                                          padding: widget
                                              .controlStyle.paddingWindowDialog,
                                          child: Text(widget.textDialog != null
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
                  //Flexible(flex: 1, child: SizedBox()),
                ],
              ),
              Stack(
                children: [
                  widget.types != null && widget.types == 'checkbox'
                      ? Container(
                          alignment: Alignment.centerRight,
                          child: TitanCheckBox(
                            abc: abc,
                            callback: callback,
                            isChecked11: widget.isChecked != null
                                ? widget.isChecked
                                : true,
                            onTap: (selected) {
                              if (widget.multiAccordion != null) {
                                toggleAccordion();
                              }
                            },
                          ),
                        )
                      : SizedBox(),
                  widget.types != null && widget.types == 'toogle'
                      ? Container(
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
                        )
                      : SizedBox(),
                  /*widget.types != null && widget.types == 'radio'
                            ? RadioButtonGroup(
                                orientation: GroupedButtonsOrientation.VERTICAL,
                                margin: const EdgeInsets.only(left: 12.0),
                                onSelected: (String selected) => setState(() {
                                  _picked = selected;
                                }),
                                labels:
                                    widget.labels != null ? widget.labels : [],
                                picked: _picked,
                                itemBuilder: (Radio rb, Text txt, int i,
                                    Widget children) {
                                  return Column(children: [
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: txt),
                                        Container(
                                            alignment: Alignment.centerRight,
                                            child: rb),
                                      ],
                                    ),
                                    children,
                                  ]);
                                },
                              )
                            : SizedBox(),*/
                  widget.types != null && widget.types == 'indicator'
                      ? Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: widget.indication!=null&&widget.indication[0]==true? Color.fromRGBO(39, 174, 96, 1):Color.fromRGBO(204, 204, 204, 1),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  radius: 8,
                                ),
                              ),
                              SizedBox(width: 2.0),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: widget.indication!=null&&widget.indication[1]==true? Color.fromRGBO(39, 174, 96, 1):Color.fromRGBO(204, 204, 204, 1),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  radius: 8,
                                ),
                              ),
                            ],
                          ),
                        )
                      /*Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor:
                                          widget.indication!=null||widget.indication==1? Color.fromRGBO(204,204,204,1):Color.fromRGBO(39, 174, 96, 1),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey.shade200,
                                        radius: 8,
                                      ),
                                    ),
                                    SizedBox(width:2.0),
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor:
                                          Color.fromRGBO(39, 174, 96, 1),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey.shade200,
                                        radius: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              )*/

                      : SizedBox(),
                ],
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
    );
  }

  @override
  void initState() {
    picked = widget.picked;
    selectedRadio = 0;
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
