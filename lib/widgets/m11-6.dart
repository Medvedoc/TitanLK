import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class M11_6 extends StatefulWidget {
  @override
  _M11_6State createState() => _M11_6State();
}

class _M11_6State extends State<M11_6> {
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
    titanButtonStandart.colors[4] = Colors.red;
    return Column(
      children: [
        Text("""КОПИРОВАНИЕ НАСТРОЕК ТЕКУЩЕГО 
    ПРОФИЛЯ ДЛЯ СОЗДАНИЯ НОВОГО
                     ПОЛЬЗОВАТЕЛЯ""", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextField(
          decoration: InputDecoration(
            labelText: "+7 (921) 987-6543",
          ),
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
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              )),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            children: [
              Icon(
                Icons.add_location,
                size: 65,
              ),
              Expanded(
                  child:
                      Text("После переноса настроек текущего профиля на новый номер телефона, аккаунт на предыдущем номере телефона деактивируется")),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TitanButton(
              controlStyle: TitanControlStyle(),
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.07,
              headButton: "ОТМЕНИТЬ",
            ),
            TitanButton(
              controlStyle: TitanControlStyle(),
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.07,
              headButton: "ОК",
            ),
          ],
        ),
      ],
    );
  }
}
