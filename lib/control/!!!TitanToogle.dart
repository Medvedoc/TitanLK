import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class TitanToogle extends StatefulWidget {
  double abc;
  Function(double) callback;

  final String textHeading;
  final String textDialog;
  final Border border;
  final List<Widget> children;
  bool isSwitched;
  Function() onToggle;

  TitanToogle({
    this.textDialog,
    this.textHeading,
    this.isSwitched,
    this.children,
    this.abc,
    this.callback,
    this.onToggle,
    this.border,
  });
  @override
  _TitanToogleState createState() => _TitanToogleState();
}

class _TitanToogleState extends State<TitanToogle> {
  double abc = 0.0;

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

  bool isSwitched;

  final GlobalKey _cardKey = GlobalKey();
  double cardSizeheight;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        key: _cardKey,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: new BoxDecoration(
          border: widget.border,
          //color: Colors.white,
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 16.0),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(widget.textDialog),
                                      ),
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
                value: widget.isSwitched,
                onToggle: (val) {
                  if (widget.onToggle != null) {
                    widget.onToggle();
                  }
                  setState(() {
                    widget.isSwitched = val;
                    print(widget.isSwitched);
                  });
                },
                activeColor: Color.fromRGBO(0, 0, 0, 1),
                inactiveColor: Color.fromRGBO(101, 91, 0, 0.4),
                toggleColor: Color.fromRGBO(255, 255, 255, 1),
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
      widget.children != null ? Column(children: widget.children) : SizedBox(),
    ]);
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    RenderBox _cardBox = _cardKey.currentContext.findRenderObject();

    cardSizeheight = _cardBox.size.height;
  }
}



