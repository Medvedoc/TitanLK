import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class M11_3 extends StatefulWidget {
  @override
  _M11_3State createState() => _M11_3State();
}

class _M11_3State extends State<M11_3> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
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
        children: [
          Text(
            "РЕДАКТИРОВАНИЕ ПРОФИЛЯ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ButtonBar(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.1,
                child: Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                    Flexible(
                      child: Text(
                        "Редактировать текущий профиль",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.1,
                child: Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                    Flexible(
                      child: Text(
                        "Перенос настроек текущего профиля на новый номер телефона",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.1,
                child: Row(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: selectedRadio,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                    Flexible(
                      child: Text(
                        "Копировать настройки текущего профиля для создания нового пользователя",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TitanButton(
                headButton: "OK",
                controlStyle: TitanControlStyle(),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              TitanButton(
                types: Types.red,
                headButton: "УДАЛИТЬ ТЕКУЩИЙ ПРОФИЛЬ",
                controlStyle: TitanControlStyle(),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
