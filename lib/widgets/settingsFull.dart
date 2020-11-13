import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitanSettingsFull extends StatefulWidget {
  @override
  _TitanSettingsFullState createState() => _TitanSettingsFullState();
}

class _TitanSettingsFullState extends State<TitanSettingsFull> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              new BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  offset: new Offset(0.0, 4.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0)
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitanButton(
                  headButton: "НАСТРОЙКА ПРОФИЛЯ",
                  //pressTap: () => pressSave(),
                  controlStyle: TitanControlStyle(),
                  types: Types.red),
              SizedBox(height: 10.0),
              TitanButton(
                  headButton: "НАСТРОЙКА УВЕДОМЛЕНИЙ",
                  //pressTap: () => pressSave(),
                  controlStyle: TitanControlStyle(),
                  types: Types.grey),
              SizedBox(height: 10.0),
              TitanButton(
                headButton: "УПРАВЛЕНИЕ ПОЛЬЗОВАТЕЛЯМИ",
                //pressTap: () => pressSave(),
                controlStyle: TitanControlStyle(),
              ),
              SizedBox(height: 10.0),
              TitanButton(
                headButton: "ТЕХНИЧЕСКАЯ ПОДДЕРЖКА",
                //pressTap: () => pressSave(),
                controlStyle: TitanControlStyle(),
              ),
              SizedBox(height: 10.0),
              TitanButton(
                headButton: "КОНТАКТЫ",
                //pressTap: () => pressSave(),
                controlStyle: TitanControlStyle(),
              ),
            ],
          )),
    );
  }
}
