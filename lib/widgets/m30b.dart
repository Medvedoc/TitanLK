import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton%20copy.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class M30b extends StatefulWidget {
  @override
  _M30bState createState() => _M30bState();
}

class _M30bState extends State<M30b> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey.shade400,
                  offset: new Offset(0.0, 5.0),
                  blurRadius: 5.0,
                )
              ],
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new AssetImage('assets/image.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Петров-Васечкин',
                style: TextStyle(
                  height: 1.20,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                'Александр',
                style: TextStyle(
                  height: 1.20,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                'Александрович',
                style: TextStyle(
                  height: 1.20,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 15.0),
      Text(
        'Действующий тарифный план (до 31.12.2020)',
        style: TextStyle(
          height: 1.20,
          color: Colors.red,
          fontFamily: 'Roboto',
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      SizedBox(height: 15.0),
      TitanButton2(
        headButton: "БИЗНЕС",
        textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.grey,
      ),
      SizedBox(height: 10.0),
      Text(
        'Текущий баланс',
        style: TextStyle(
          height: 1.20,
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        iconTextRight: FontAwesomeIcons.rubleSign,
        iconSize: 18.0,
        textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        headButton: "3 550,00",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.red,
      ),
      SizedBox(height: 15.0),
      Text(
        'Способ оплаты абонентской платы:',
        style: TextStyle(
          height: 1.20,
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      SizedBox(height: 5.0),
      Text(
        'за счёт предприятия',
        style: TextStyle(
          height: 1.20,
          color: Colors.red,
          fontFamily: 'Roboto',
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      SizedBox(height: 15.0),
      Text(
        'Способ оплаты вызова группы реагирования:',
        style: TextStyle(
          height: 1.20,
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      SizedBox(height: 5.0),
      Text(
        'за счёт предприятия',
        style: TextStyle(
          height: 1.20,
          color: Colors.red,
          fontFamily: 'Roboto',
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      SizedBox(height: 15.0),
      TitanButton2(
        headButton: "ПОПОЛНИТЬ БАЛАНС",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: "ИЗМЕНИТЬ ЛИЧНЫЕ ДАННЫЕ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: "КОНТАКТНАЯ ИНФОРМАЦИЯ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: "ПИН-КОД",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: "СВЯЗАТЬСЯ С НАМИ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        //iconButton: FontAwesomeIcons.timesCircle,
        iconButton: Icons.ac_unit,
        timer: true,
        headButton: "НАСТРОЙКА ПРОФИЛЯ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.red,
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: "Закрыть",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.grey,
      ),
    ]);
  }
}
