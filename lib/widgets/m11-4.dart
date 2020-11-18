import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/!!!TitanToogle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class M11_4 extends StatefulWidget {
  @override
  _M11_4State createState() => _M11_4State();
}

class _M11_4State extends State<M11_4> {
  double abc = 0.0;

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Text("Создание Пользователя".toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text("Объекты пользователя", style: TextStyle(fontSize: 20))),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          TitanButton(
            types: Types.yellow,
            headButton: "УДАЛИТЬ ТЕКУЩИЙ ПРОФИЛЬ",
            controlStyle: TitanControlStyle(),
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          TitanToogleAccordion(
            types: Toogle.toogle,
            multiAccordion: true,
            textHeading:
                'Подключение объектов для удалённого администрирования и контроля ',
            textStyle: TextStyle(
              fontSize: 15,
            ),
            callback: callback,
            children: [
              TitanToogle(
                textHeading: 'Может создавать других пользователей',
                isSwitched: false,
                border: Borderic.all(),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                child: Text("Объекты удалённого администрирования",
                    style: TextStyle(fontSize: 20)),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              Text('''Добавлено 25 
  объектов'''),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TitanButton(
            types: Types.yellow,
            headButton: "ДАЛЕЕ",
            controlStyle: TitanControlStyle(),
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ],
      ),
    );
  }
}
