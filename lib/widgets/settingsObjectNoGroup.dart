import 'package:flutter_image/control/TitanPicker.dart';
import 'package:flutter_image/control/TitanPickerAccordion.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
import 'package:flutter_image/control/TitanToogle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitanSettingsObjectNoGroup extends StatefulWidget {
  @override
  _TitanSettingsObjectNoGroupState createState() => _TitanSettingsObjectNoGroupState();
}

class _TitanSettingsObjectNoGroupState extends State<TitanSettingsObjectNoGroup> {
  double abc = 0.0;

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

  double abc11 = 0.0;

  callback11(heightBlock11) {
    setState(() {
      abc11 = heightBlock11;
    });
  }

  bool abc1 = false;

  callback1(heightBlock1) {
    setState(() {
      abc1 = heightBlock1;
    });
  }

  Alignment alignment; //Начало раскрывания контенера
  double _height = 0.0; //Высота раскрывающегося контейнера
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _paddingVertical = 0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  int _counter = 0; //Переключатель срабатывания Dropbox
  bool isSwitched = false;
  bool isSwitched2 = false;
  List<bool> _sumPadding = [false, false, false, false, false, false];
  //bool isSwitched1 = false;
  //bool isSwitched2 = false;
  //bool isSwitched3 = false;

  //List value;

  //final double listSpec = 4.0;
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //print("Основной блок $abc");
    return Column(
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
        SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Основные настройки',
            style: TextStyle(
              fontSize: 18.0,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0.90,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TitanToogleAccordion(
          multiAccordion: true,
          callback: callback,
          textDialog: '111',
          textHeading: 'Получать уведомления',
          children: [
            TitanToogle(
              textHeading: 'Полная постановка под охрану',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Постановка под охрану по разделам',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Первое снятие объекта с охраны',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Снятие объекта с охраны по разделам',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Тревога',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Отсутствие 220',
              isSwitched: false,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Восстановление 220',
              isSwitched: false,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Разряд АКБ',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Пожарная тревога',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
            TitanToogle(
              textHeading: 'Снятие пожарной тревоги',
              isSwitched: true,
              border: [1, 1, 0, 1],
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Дополнительные настройки',
            style: TextStyle(
              fontSize: 18.0,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0.90,
            ),
          ),
        ),
        SizedBox(height: 10.0),

        //Text('$abc'),
        // Text('$abc11'),
        TitanToogleAccordion(
          multiAccordion: true,
          callback: callback,
          textDialog: '111',
          textHeading: 'Услуга Тревога Расписания',
          children: [
            TitanToogleAccordion(
              border: [1, 1, 1, 1],
              callback: callback,
              textHeading: 'Снятие объекта с охраны',
              children: [
                TitanPickerAccordion(
                  border: [0, 1, 1, 1],
                  callback11: callback11,
                  textHeading: 'Пн-Вс',
                  children: [
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пн',
                      isChecked: false,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Ср',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Чт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Сб',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вс',
                      isChecked: false,
                    ),
                  ],
                ),
              ],
            ),
            TitanToogleAccordion(
              border: [1, 1, 1, 1],
              callback: callback,
              textHeading: 'Постановка объекта под охрану',
              children: [
                TitanPickerAccordion(
                  border: [0, 1, 1, 1],
                  callback11: callback11,
                  textHeading: 'Пн-Вс',
                  children: [
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пн',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Ср',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Чт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Сб',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вс',
                      isChecked: false,
                    ),
                  ],
                ),
              ],
            ),
            TitanToogleAccordion(
              border: [1, 1, 1, 1],
              callback: callback,
              textHeading: 'Постановка объекта под охрану',
              children: [
                TitanPickerAccordion(
                  border: [0, 1, 1, 1],
                  callback11: callback11,
                  textHeading: 'Пн-Вс',
                  children: [
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пн',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Ср',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Чт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Сб',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вс',
                      isChecked: false,
                    ),
                  ],
                ),
              ],
            ),
            TitanToogleAccordion(
              border: [1, 1, 1, 1],
              callback: callback,
              textHeading: 'Постановка объекта под охрану',
              children: [
                TitanPickerAccordion(
                  border: [0, 1, 1, 1],
                  callback11: callback11,
                  textHeading: 'Пн-Вс',
                  children: [
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пн',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Ср',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Чт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Сб',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вс',
                      isChecked: false,
                    ),
                  ],
                ),
              ],
            ),
            TitanToogleAccordion(
              border: [1, 1, 1, 1],
              callback: callback,
              textHeading: 'Постановка объекта под охрану',
              children: [
                TitanPickerAccordion(
                  border: [0, 1, 1, 1],
                  callback11: callback11,
                  textHeading: 'Пн-Вс',
                  children: [
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пн',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Ср',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Чт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Пт',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Сб',
                      isChecked: true,
                    ),
                    TitanPicker(
                      border: [0, 1, 1, 1],
                      textHeading: 'Вс',
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
    );
  }
}
