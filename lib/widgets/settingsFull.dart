import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/theme/themeStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitanSettingsFull extends StatefulWidget {
  @override
  _TitanSettingsFullState createState() => _TitanSettingsFullState();
}

class _TitanSettingsFullState extends State<TitanSettingsFull> {
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "НАСТРОЙКА ПРОФИЛЯ",
          style: titanButtonStandart2,
          width: 250.0,
          height: 100.0,
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "НАСТРОЙКА УВЕДОМЛЕНИЙ",
          style: titanButtonStandart2,
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "УПРАВЛЕНИЕ ПОЛЬЗОВАТЕЛЯМИ",
          style: titanButtonStandart2,
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ТЕХНИЧЕСКАЯ ПОДДЕРЖКА",
          style: titanButtonStandart2,
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "КОНТАКТЫ",
          style: titanButtonStandart2,
        ),
      ],
    );
  }
}
