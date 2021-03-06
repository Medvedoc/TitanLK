import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class M11_2 extends StatefulWidget {
  @override
  _M11_2State createState() => _M11_2State();
}

class _M11_2State extends State<M11_2> {
  @override
  Widget build(BuildContext context) {
    var titanButtonStandart = TitanButtonStyle();

    titanButtonStandart.colors[14] = Colors.black;
    titanButtonStandart.colors[15] = Colors.black;
    titanButtonStandart.textShadowx = 0;
    titanButtonStandart.textShadowy = 0;
    titanButtonStandart.intensity = 0;
    titanButtonStandart.showShadow = false;
    titanButtonStandart.fontWeight400 = FontWeight.bold;
    return Column(
      children: [
        Text(
          'ЛИЧНЫЕ ДАННЫЕ ПОЛЬЗОВАТЕЛЯ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Телефонный номер",
                  helperText: "Тут отображаются ошибки",
                ),
              ),
            ),
            TitanButton(
              //pressTap: () => pressSave(),
              icon: Icons.call,
              controlStyle: TitanControlStyle(),
              width: 75.0,
              height: 38,
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Фамилия",
            helperText: "Тут отображаются ошибки",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Имя",
            helperText: "Тут отображаются ошибки",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "E-mail",
            helperText: "Тут отображаются ошибки",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Тип пользователя",
            helperText: "Тут отображаются ошибки",
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TitanButton(
          headButton: "ОБЪЕКТЫ ПОЛЬЗОВАТЕЛЯ",
          controlStyle: TitanControlStyle(),
          width: MediaQuery.of(context).size.width * 0.9,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TitanButton(
          headButton: "ОБЪЕКТЫ АДМИНИСТИРОВАНИЯ",
          controlStyle: TitanControlStyle(),
          width: MediaQuery.of(context).size.width * 0.9,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        TitanButton(
          headButton: "РЕДАКТИРОВАТЬ ПРОФИЛЬ",
          controlStyle: TitanControlStyle(),
          width: MediaQuery.of(context).size.width * 0.9,
        ),
      ],
    );
  }
}
