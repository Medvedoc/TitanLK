import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserManagment extends StatefulWidget {
  @override
  _UserManagmentState createState() => _UserManagmentState();
}

class _UserManagmentState extends State<UserManagment> {
  @override
  Widget build(BuildContext context) {
    var titanButtonStandart = TitanButtonStyle();
    titanButtonStandart.colors[14] = Colors.black;
    titanButtonStandart.colors[15] = Colors.black;
    titanButtonStandart.textShadowx = 0;
    titanButtonStandart.textShadowy = 0;
    titanButtonStandart.intensity = 0;
    titanButtonStandart.showShadow = false;

    var titanButtonStandart2 = TitanButtonStyle();
    //titanButtonStandart2.colors[14] = Colors.black;
    titanButtonStandart2.colors[14] = Colors.black54;
    titanButtonStandart2.colors[15] = Colors.black45;
    titanButtonStandart2.textShadowx = -9;
    titanButtonStandart2.textShadowy = -9;
    titanButtonStandart2.intensity = 2;
    titanButtonStandart2.showShadow = true;

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
      children: [
        Text(
          'управление пользователями'.toUpperCase(),
          style: TextStyle(
            fontSize: 18.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0.90,
          ),
        ),
        SizedBox(height: 15.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "СОЗДАТЬ ПОЛЬЗОВАТЕЛЯ",
          controlStyle: TitanControlStyle(),
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "СПИСОК ПОЛЬЗОВАТЕЛЕЙ",
          controlStyle: TitanControlStyle(),
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ВСЕ ОБЪЕКТЫ",
          controlStyle: TitanControlStyle(),
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ДОГОВОР",
          controlStyle: TitanControlStyle(),
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ГРУППА ОБЪЕКТОВ/ДОГОВОРОВ",
          controlStyle: TitanControlStyle(),
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ОБЪЕКТ",
          controlStyle: TitanControlStyle(),
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ТИП ПОЛЬЗОВАТЕЛЯ",
          controlStyle: TitanControlStyle(),
        ),
      ],
    ),
          ),
        );
  }
}
