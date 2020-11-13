import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class M11_5 extends StatefulWidget {
  @override
  _M11_5State createState() => _M11_5State();
}

class _M11_5State extends State<M11_5> {
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
            Text("""ПЕРЕНОС НАСТРОЕК ТЕКУЩЕГО
  ПРОФИЛЯ НА НОВЫЙ НОМЕР 
                  ТЕЛЕФОНА""",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                labelText: "+7 (921) 987-6543",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
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
                      child: Text(
                          "После переноса настроек текущего профиля на новый номер телефона, аккаунт на предыдущем номере телефона деактивируется")),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
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
        ),
      ),
    );
  }
}
