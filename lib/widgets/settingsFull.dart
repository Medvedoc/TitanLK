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
    /*var styles = TitanControlStyle();
    styles.buttonColorGradient = [
      Color.fromRGBO(153, 228, 0, 1),
      Color.fromRGBO(137, 212, 3, 1),
    ];
    styles.buttonColorBody = Color.fromRGBO(153, 228, 0, 1);*/

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitanButton(
          headButton: "НАСТРОЙКА ПРОФИЛЯ",
          //pressTap: () => pressSave(),
          controlStyle: TitanControlStyle(),
          type:'red'
        ),
        SizedBox(height: 10.0),
        TitanButton(
          headButton: "НАСТРОЙКА УВЕДОМЛЕНИЙ",
          //pressTap: () => pressSave(),
          controlStyle: TitanControlStyle(),
          type: 'gray'
        ),
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
        //SizedBox(height: 10.0),
        /*TitanButton(
          width: 48,
          height: 50,
          icon: Icons.chat_outlined,
          borderRadius: 50.0,
          controlStyle: TitanControlStyle(),
          type: 'yellow',
        ),*/
      ],
    );
  }
}
