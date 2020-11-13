import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitanSettingsNotifications extends StatefulWidget {
  @override
  _TitanSettingsNotificationsState createState() =>
      _TitanSettingsNotificationsState();
}

class _TitanSettingsNotificationsState
    extends State<TitanSettingsNotifications> {
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
        Text(
          'НастройкА уведомлений'.toUpperCase(),
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
          headButton: "ОБЪЕКТЫ БЕЗ ГРУППЫ",
          controlStyle: TitanControlStyle(),
          types: Types.yellow,
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ГРУППЫ ОБЪЕКТОВ/ДОГОВОРОВ",
          controlStyle: TitanControlStyle(),
          types: Types.yellow,
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ДОГОВОР",
          controlStyle: TitanControlStyle(),
          types: Types.yellow,
        ),
        SizedBox(height: 10.0),
        TitanButton(
          //pressTap: () => pressSave(),
          headButton: "ОБЪЕКТ",
          controlStyle: TitanControlStyle(),
          types: Types.yellow,
        ),
      ],
    );
  }
}
