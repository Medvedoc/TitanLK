import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanTimeAccordion.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanPicker.dart';
import 'package:intl/intl.dart';

class TitanSettingsObjectNoGroup extends StatefulWidget {
  @override
  _TitanSettingsObjectNoGroupState createState() =>
      _TitanSettingsObjectNoGroupState();
}

class _TitanSettingsObjectNoGroupState
    extends State<TitanSettingsObjectNoGroup> {
  List<String> heading = [
    'ОБЪЕКТЫ БЕЗ ГРУППЫ',
    'Основные настройки',
    'Дополнительные настройки',
  ];
  List<String> text = [
    'Получать уведомления',
    'Полная постановка под охрану',
    'Постановка под охрану по разделам',
    'Первое снятие объекта с охраны',
    'Снятие объекта с охраны по разделам',
    'Тревога',
    'Отсутствие 220',
    'Восстановление 220',
    'Разряд АКБ',
    'Пожарная тревога',
    'Снятие пожарной тревоги',
    'Услуга Тревога Расписания',
    'Снятие объекта с охраны',
    'Постановка объекта под охрану',
  ];
  List<String> timetable = ['Пн-Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

  callback(heightBlock) {
    setState(() {});
  }

  callback11(heightBlock11) {
    setState(() {});
  }

  callback1(heightBlock1) {
    setState(() {});
  }

  Alignment alignment; //Начало раскрывания контенера
  double _height = 0.0; //Высота раскрывающегося контейнера
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _paddingVertical =
      0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  int _counter = 0; //Переключатель срабатывания Dropbox
  bool isSwitched = false;
  bool isSwitched2 = false;
  List<bool> _sumPadding = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [new BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), offset: new Offset(0.0, 4.0), blurRadius: 4.0, spreadRadius: 2.0)],
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            width: double.infinity,
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          heading[0].toUpperCase(),
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            heading[1],
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(height: 10.0),
        TitanToogleAccordion(
          background: Color.fromRGBO(233, 200, 45, 1),
          border: Borderic.all(),
          textHeading: text[0],
          multiAccordion: true,
          callback: callback,
          controlStyle: TitanControlStyle(),
          children: [
            TitanToogleAccordion(
              border: Borderic.rbl(),
              textHeading: text[1],
              isSwitched: true,
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[2],
              isSwitched: true,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[3],
              isSwitched: true,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[4],
              isSwitched: true,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[5],
              border: Borderic.rbl(),
              isSwitched: true,
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[6],
              isSwitched: false,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[7],
              isSwitched: false,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[8],
              isSwitched: true,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[9],
              isSwitched: true,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
            TitanToogleAccordion(
              textHeading: text[10],
              isSwitched: true,
              border: Borderic.rbl(),
              controlStyle: TitanControlStyle(),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            heading[2],
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(height: 10.0),

        //Text('$abc'),
        // Text('$abc11'),
        TitanToogleAccordion(
          background: Color.fromRGBO(233, 200, 45, 1),
          border: Borderic.all(),
          textHeading: text[11],
          multiAccordion: true,
          callback: callback,
          controlStyle: TitanControlStyle(),
          children: [
            TitanToogleAccordion(
              margin: EdgeInsets.only(top: 10.0),
              border: Borderic.all(),
              callback: callback,
              textHeading: text[12],
              multiAccordion: true,
              controlStyle: TitanControlStyle(),
              children: [
                TitanTimeAccordion(
                  border: Borderic.rbl(),
                  callback11: callback11,
                  textHeading: timetable[0],
                  isChecked: true,
                  multiAccordion: true,
                  children: [
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[1],
                      isChecked: false,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[2],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[3],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[4],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[5],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[6],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[7],
                      isChecked: false,
                    ),
                  ],
                ),
              ],
            ),
            TitanToogleAccordion(
              margin: EdgeInsets.only(top: 10.0),
              border: Borderic.all(),
              callback: callback,
              textHeading: text[13],
              multiAccordion: true,
              children: [
                TitanTimeAccordion(
                  border: Borderic.rbl(),
                  callback11: callback11,
                  textHeading: timetable[0],
                  isChecked: false,
                  multiAccordion: true,
                  children: [
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[1],
                      isChecked: false,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[2],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[3],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[4],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[5],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[6],
                      isChecked: true,
                    ),
                    TitanTimeAccordion(
                      border: Borderic.rbl(),
                      textHeading: timetable[7],
                      isChecked: false,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30.0),
      ],
    ),
          ),
        );
  }
}
