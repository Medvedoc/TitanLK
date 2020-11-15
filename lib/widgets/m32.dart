import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class M32 extends StatefulWidget {
  @override
  _M11_5State createState() => _M11_5State();
}

class _M11_5State extends State<M32> {
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
          Text('Охрана для всего предприятия'.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.grey.shade400,
              offset: new Offset(0.0, 2.0),
              blurRadius: 5.0,
            )
          ],
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/!.png'),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(
                          'Теперь Вам не нужно переживать за безопасность своих любимых сотрудников!',
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height: 10.0),
                      Text(
                          'Они самостоятельно смогут оплачивать активацию услуги (абонентскую плату), а также стоимость выезда Группы Быстрого Реагирования (ГБР) за счёт средств предприятия.',
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 306.0),
          TitanToogleAccordion(
            background: Colors.grey.shade200,
            border: Borderic.zero(),
            textHeading: 'Иванов Иван',
            textsubHeading: 'менеджер',
            types: Toogle.indicator,
            indication: Indication.all,
          ),
          SizedBox(height: 5.0),
          TitanToogleAccordion(
            background: Colors.grey.shade200,
            border: Borderic.zero(),
            textHeading: 'Иванов Иван',
            textsubHeading: 'менеджер',
            types: Toogle.indicator,
            indication: Indication.zero,
          ),
          SizedBox(height: 5.0),
          TitanToogleAccordion(
            background: Colors.grey.shade200,
            border: Borderic.zero(),
            textHeading: 'Иванов Иван',
            textsubHeading: 'менеджер',
            types: Toogle.indicator,
            indication: Indication.first,
          ),
          SizedBox(height: 5.0),
          TitanToogleAccordion(
            background: Colors.grey.shade200,
            border: Borderic.zero(),
            textHeading: 'Иванов Иван',
            textsubHeading: 'менеджер',
            types: Toogle.indicator,
            indication: Indication.second,
          ),
          SizedBox(height: 30.0),
          TitanButton(
            controlStyle: TitanControlStyle(),
            headButton: "ДОБАВИТЬ УЧАСТНИКА",
          ),
          SizedBox(height: 15.0),
          TitanButton(
            controlStyle: TitanControlStyle(),
            headButton: "Отменить",
            types: Types.grey
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
