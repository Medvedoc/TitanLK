import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/elements/TitanBox.dart';
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
    return Column(
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
    );
  }
}
