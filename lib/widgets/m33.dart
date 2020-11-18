import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
import 'package:get/get.dart';

class M33 extends StatefulWidget {
  @override
  _M33State createState() => _M33State();
}

class _M33State extends State<M33> {
  List<List> card = [
    ['Иванов Иван1', 'менеджер1', true, true],
    ['Иванов Иван2', 'менеджер2', false, false],
    ['Иванов Иван3', 'менеджер3', true, false],
    ['Иванов Иван4', 'менеджер4', false, true],
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('security_entire_enterprise'.tr.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
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
          SizedBox(height: 30.0),
          ListView.builder(
              shrinkWrap: true,
              itemCount: card.length,
              itemBuilder: (BuildContext context, int index) {
                return TitanToogleAccordion(
                  background: Colors.grey.shade200,
                  border: Borderic.zero(),
                  textHeading: card[index][0],
                  textsubHeading: card[index][1],
                  types: Toogle.indicator,
                  indication: [card[index][2], card[index][3]],
                );
              }),
          SizedBox(height: 30.0),
          TitanButton(
            controlStyle: TitanControlStyle(),
            headButton: 'add_member'.tr,
          ),
          SizedBox(height: 15.0),
          TitanButton(
              controlStyle: TitanControlStyle(),
              headButton: 'cancal'.tr,
              types: Types.grey),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
