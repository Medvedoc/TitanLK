import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanCheckbox.dart';
import 'package:flutter_image/control/TitanPicker.dart';
import 'package:intl/intl.dart';

class TitanTimeAccordion extends StatefulWidget {
  TitanTimeAccordion({
    this.textDialog,
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
    this.onToogle,
    this.isChecked,
  });

  final Border border;
  final bool isChecked;
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
  _TitanTimeAccordionState createState() => _TitanTimeAccordionState();
}

class _TitanTimeAccordionState extends State<TitanTimeAccordion>
    with TickerProviderStateMixin {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      key: _renderKey,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          decoration: new BoxDecoration(
            color: Colors.grey.shade200,
            border: widget.border,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    // Text("$abc"),
                    TitanCheckBox(
                      abc: abc,
                      callback: callback,
                      isChecked11:
                          widget.isChecked != null ? widget.isChecked : true,
                      onTap: (selected) {
                        if (widget.multiAccordion != null) {
                          toggleAccordion();
                        }
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
                          showPickerNumberFormatValue(context, 1);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70.0,
                        height: 30.0,
                        decoration: new BoxDecoration(
                          border: new Border.all(
                              color: Color.fromRGBO(
                                  0, 0, 0, abc != true ? 1 : 0.2),
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        child: Text('$toTime',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(
                                  0, 0, 0, abc != true ? 1 : 0.2),
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
                          showPickerNumberFormatValue(context, 2);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70.0,
                        height: 30.0,
                        decoration: new BoxDecoration(
                          border: new Border.all(
                              color: Color.fromRGBO(
                                  0, 0, 0, abc != true ? 1 : 0.2),
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        child: Text('$fromTime',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(
                                  0, 0, 0, abc != true ? 1 : 0.2),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        widget.multiAccordion != null
            ? showAccordion
                ? Container(
                    margin: EdgeInsets.only(
                        bottom: showAccordion != false ? 10.0 : 0.0),
                    child: SlideTransition(
                      position: offset,
                      child: Column(
                        children: widget.children,
                      ),
                    ),
                  )
                : Container()
            : Container(),
      ],
    );
  }

  showPickerNumberFormatValue(BuildContext context, int number) {
    abc != true
        ? TitanPicker(
          containerColor :Colors.yellow,
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
            onConfirm: (TitanPicker picker, List value) {
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

  @override
  void initState() {
    widget.isChecked == true ? abc = false : abc = true;
    widget.isChecked == false
        ? showAccordion = !widget.showAccordion
        : showAccordion = widget.showAccordion;
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
    renderKeyHeight11 = _renderBox.size.height;
    renderKeyPosition = _renderBox.localToGlobal(Offset.zero).dy;
    screenSize = MediaQuery.of(context).size.height;
    widget.callback11(renderKeyHeight11);

    (screenSize - renderKeyPosition) > renderKeyHeight11
        ? SizedBox()
        : Scrollable.ensureVisible(
            _renderKey.currentContext,
            alignment: 0.0,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
            alignmentPolicy: renderKeyHeight11 > screenSize
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
    widget.callback11(
      renderKeyHeight11,
    );
  }
}
