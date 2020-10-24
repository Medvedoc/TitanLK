import 'package:flutter_image/control/TitanSwitch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitanSettingsObjectNoGroup extends StatefulWidget {
  @override
  _TitanSettingsObjectNoGroupState createState() =>
      _TitanSettingsObjectNoGroupState();
}

class _TitanSettingsObjectNoGroupState
    extends State<TitanSettingsObjectNoGroup> {
  Alignment alignment; //Начало раскрывания контенера
  double _height = 0.0; //Высота раскрывающегося контейнера
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _paddingVertical =
      0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  int _counter = 0; //Переключатель срабатывания Dropbox
  bool isSwitched = false;
  List<bool> _sumPadding = [false, false, false];
  //bool isSwitched1 = false;
  //bool isSwitched2 = false;
  //bool isSwitched3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ОБЪЕКТЫ БЕЗ ГРУППЫ'.toUpperCase(),
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                height: 0.90,
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              padding: EdgeInsets.only(left: 10.0),
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
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        padding: const EdgeInsets.all(7.0),
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
                    ],
                  ),
                  ListTileSwitch(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                        if (_counter == 0) {
        _height = _visible
            ? 0.0
            : 200.0;
        _visible = !_visible;
        _paddingVertical = 0;
        _counter += 1;
        
      } else {
        _counter -= 1;
        _visible = !_visible;
        _height = 0;
        alignment = Alignment.topCenter;
      }
                      });
                    },
                    switchActiveColor: Colors.black,
                    switchInactiveColor: Color.fromRGBO(101, 91, 0, 0.2),
                    circleActiveColor: Colors.white,
                    circleInactiveColor: Colors.white,
                  ),
                ],
              ),
            ),
            InkWell(
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
                    padding: EdgeInsets.only(left: 10.0),
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
                        ListTileSwitch(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          value: _sumPadding[index],
                          onChanged: (value) {
                            setState(() {
                              _sumPadding[index] = value;
                              print('Block $index ${_sumPadding[index]}');
                            });
                          },
                          switchActiveColor: Colors.black,
                          switchInactiveColor: Color.fromRGBO(101, 91, 0, 0.2),
                          circleActiveColor: Colors.white,
                          circleInactiveColor: Colors.white,
                        ),
                      ],
                    ),
                  ),),
                );
              },
            ),
              ),
            ),
          ),


            
          ],
        ),
      ],
    );
  }
}
