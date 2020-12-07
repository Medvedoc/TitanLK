import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:flutter_image/page/mainPage.dart';
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
              physics: ScrollPhysics(),
              itemCount: card.length,
              itemBuilder: (BuildContext context, int index) {
                return TitanBox(
                  type: Type.indicator(alignment: TypeAlignment.rightblock, indications: [card[index][2], card[index][3]]),
                  style: Decorations(
                      background:
                          ColorTheme.coloris(color: Colors.grey.shade200),
                      border: BorderTheme.zero,
                      textAlignment: MainAxisAlignment.start),
                  title: TitleString(title: card[index][0], textStyle: Theme.of(context).textTheme.headline3),
                  subtitle: SubTitleString(subtitle: card[index][1]),
                );
              }),
          SizedBox(height: 30.0),
          TitanBox(
              type: Type.button(),
              style: Decorations(
                  background: ColorTheme.yellow, border: BorderTheme.button),
              title: TitleString(title: 'add_member'.tr, upperCase: true)),
          SizedBox(height: 15.0),
          TitanBox(
              onTap: (value1, value2, value3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              type: Type.button(),
              style: Decorations(
                  background: ColorTheme.grey, border: BorderTheme.button),
              title: TitleString(title: 'cancal'.tr, upperCase: true)),
        ],
      ),
    );
  }
}
