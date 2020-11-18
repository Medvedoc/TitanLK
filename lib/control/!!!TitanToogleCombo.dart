import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/!!!TitanContainer.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class TitanToogleCombo extends StatefulWidget {
  @override
  _TitanToogleComboState createState() => _TitanToogleComboState();
}

class _TitanToogleComboState extends State<TitanToogleCombo> {
  Alignment alignment; //Начало раскрывания контенера
  double _height; //Высота раскрывающегося контейнера
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double paddingVertical = 0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  int _counter = 0; //Переключатель срабатывания Dropbox
  bool isSwitched = false;
  bool isSwitched2;
  List<bool> _sumPadding = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border(
              left: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
              right: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
              top: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
              bottom: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Показывать Пуш-уведомления',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color.fromRGBO(101, 91, 0, 0.5), width: 2.0, style: BorderStyle.solid),
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
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.all(10), child: Text("TextTextTextTextTextTextTextTextTextTextTextTextText")),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlutterSwitch(
                  value: isSwitched,
                  onToggle: (val) {
                    setState(() {
                      isSwitched = val;
                      print(isSwitched);
                      if (_counter == 0) {
                        _height = _visible ? 0.0 : 200.0;
                        _visible = !_visible;
                        paddingVertical = 0;
                        _counter += 1;
                      } else {
                        _counter -= 1;
                        _visible = !_visible;

                        _height = 0.0;

                        alignment = Alignment.topCenter;
                      }
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
        ),
        TitanContainer(
          height: _height,
          sumPadding: _sumPadding,
          visible: _visible,
          children: <Widget>[
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            SizedBox(height: 30.0)
            /*TitanToogle(
              textDialog: '111',
              textHeading: '222',
              isSwitched: true,
              border: [1, 1, 1, 1],
              //abc: abc,
            ),*/
          ],
        ),
        /*InkWell(
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            //duration: widget.style.duration[0],
            duration: Duration(milliseconds: 100),
            child: AnimatedContainer(
              //color: Colors.red,
              //margin: widget.style.edgeInsets[6],
              alignment: Alignment.topCenter,
              height: _height,
              //duration: widget.style.duration[1],
              duration: Duration(milliseconds: 100),
              curve: Curves.fastOutSlowIn,
              child: ListView.builder(
                reverse: false,
                shrinkWrap: true,
                //padding: widget.style.edgeInsets[11],
                //itemCount: widget.listparams.length,
                itemCount: 3,
                primary: false,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //padding: widget.style.edgeInsets[12],
                    //child: widget.listparams[index],
                    //child: Text('$index'),
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          border: new Border(
                            left: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              width: 1.0,
                            ),
                            top: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Запрашивать Пин-код $index',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: FlutterSwitch(
                                value: _sumPadding[index],
                                onToggle: (value) {
                                  setState(() {
                                    _sumPadding[index] = value;
                                    print('Block $index ${_sumPadding[index]}');
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
                            /*ListTileSwitch(
                                  contentPadding: EdgeInsets.only(left: 10.0),
                                  value: _sumPadding[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _sumPadding[index] = value;
                                      print(
                                          'Block $index ${_sumPadding[index]}');
                                    });
                                  },
                                  switchActiveColor: Colors.black,
                                  switchInactiveColor:
                                      Color.fromRGBO(101, 91, 0, 0.2),
                                  circleActiveColor: Colors.white,
                                  circleInactiveColor: Colors.white,
                                ),*/
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}
