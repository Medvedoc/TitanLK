import 'package:flutter_image/control/TitanContainer.dart';
import 'package:flutter_image/control/TitanToogle.dart';
import 'package:flutter_image/control/TitanToogleCombo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TitanSettingsObjectNoGroup extends StatefulWidget {
  @override
  _TitanSettingsObjectNoGroupState createState() =>
      _TitanSettingsObjectNoGroupState();
}

class _TitanSettingsObjectNoGroupState
    extends State<TitanSettingsObjectNoGroup> {
  double abc = 0.0;

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

  String toTime = '13:45';
  String fromTime = '16:45';
  String toTimeHour;
  String toTimeMinute;
  String fromTimeHour;
  String fromTimeMinute;
  bool isChecked = false;

  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  Alignment alignment; //Начало раскрывания контенера
  double _height = 0.0; //Высота раскрывающегося контейнера
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _paddingVertical =
      0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  int _counter = 0; //Переключатель срабатывания Dropbox
  bool isSwitched = false;
  bool isSwitched2;
  List<bool> _sumPadding = [false, false, false, false, false, false];
  //bool isSwitched1 = false;
  //bool isSwitched2 = false;
  //bool isSwitched3 = false;

  //List value;

  //final double listSpec = 4.0;
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    print("Основной блок $abc");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Размер блока полученный $abc"),
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
            TitanToogleCombo(
              //textDialog: '1111',
              //textHeading: '2222',
              //isSwitched: true,
              //border: [1, 1, 1, 1],
              //callback: callback,
            ),
            TitanToogle(
              textDialog: '111',
              textHeading: '222',
              isSwitched: true,
              border: [1, 1, 1, 1],
              //abc: abc,
              callback: callback,
            ),
            /*Container(
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
                                          child: Text(
                                              "TextTextTextTextTextTextTextTextTextTextTextTextText")),
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
                            _height = _visible ? 0.0 : 400.0;
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
            ),*/
            //TitanContainer(),
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
                                        print(
                                            'Block $index ${_sumPadding[index]}');
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
                  bottom: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    fit: StackFit.loose,
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(value: true, onChanged: null),
                          Text(
                            'ПН-ВС',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    fit: StackFit.loose,
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'до ',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              showPickerNumberFormatValue(context);
                            },
                            child: Text(
                              '$toTime',
                            ),
                          ),
                          Text(
                            'после ',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              showPickerNumberFormatValue2(context);
                            },
                            child: Text(
                              '$fromTime',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /*Column(
              children: <Widget>[
                SizedBox(height: 16),
                Text('Default', style: Theme.of(context).textTheme.title),
                integerInfiniteNumberPicker,
                new RaisedButton(
                  onPressed: () => _showInfIntDialog(),
                  child: new Text("Current int value: $_currentInfIntValue"),
                ),
                Divider(color: Colors.grey, height: 32),
                Text('Decorated', style: Theme.of(context).textTheme.title),
                integerInfiniteDecoratedNumberPicker,
                Text(
                  "Current int value: $_currentInfIntValueDecorated",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )*/
          ],
        ),
      ],
    );
  }

  showPickerNumberFormatValue(BuildContext context) {
    Picker(
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
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 10.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker..getSelectedValues());
          setState(() {
            toTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
            toTimeMinute = (value[1] < 10) ? "0${value[1]}" : "${value[1]}";
            toTime = '$toTimeHour:$toTimeMinute';
            print(toTime);
          });
        }).showDialog(context);
  }

  showPickerNumberFormatValue2(BuildContext context) {
    Picker(
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
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 10.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker..getSelectedValues());
          setState(() {
            fromTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
            fromTimeMinute = (value[1] < 10) ? "0${value[1]}" : "${value[1]}";
            fromTime = '$fromTimeHour:$fromTimeMinute';
            print(fromTime);
          });
        }).showDialog(context);
  }
}
