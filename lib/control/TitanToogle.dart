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
  final List<num> border;
  bool isSwitched;

  TitanToogle({
    this.textDialog,
    this.textHeading,
    this.isSwitched,
    this.border,
    this.abc,
    this.callback,
  });
  @override
  _TitanToogleState createState() => _TitanToogleState();
}

class _TitanToogleState extends State<TitanToogle> {
  final GlobalKey _cardKey = GlobalKey();
  double cardSizeheight;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    RenderBox _cardBox = _cardKey.currentContext.findRenderObject();
    cardSizeheight = _cardBox.size.height;
    print('Внутренний блок $cardSizeheight');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children:<Widget>[
      
          FlatButton(
            onPressed: () {
              widget.callback(cardSizeheight); 
              //print(widget.callback(cardSizeheight));
            },
            child: new Text(widget.abc.toString()),
            color: Colors.red,
          ),
      Container(
      key: _cardKey,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          left: widget.border[0] != 0
              ? BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1.0,
                )
              : BorderSide.none,
          right: widget.border[1] != 0
              ? BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1.0,
                )
              : BorderSide.none,
          top: widget.border[2] != 0
              ? BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1.0,
                )
              : BorderSide.none,
          bottom: widget.border[3] != 0
              ? BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  width: 1.0,
                )
              : BorderSide.none,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                widget.textHeading,
                style: TextStyle(
                  fontSize: 13.0,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                widget.callback(cardSizeheight); 
                setState(() {
                  widget.isSwitched = val;
                  print(widget.isSwitched);
                });
              },
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              toggleColor: Colors.white,
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
    )]);
  }

  
}
