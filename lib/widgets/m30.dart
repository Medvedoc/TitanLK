import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:flutter_image/page/mainPage.dart';
import 'package:get/get.dart';

class M30 extends StatefulWidget {
  final TitanControlStyle controlStyle;
  M30({this.controlStyle});

  @override
  _M30State createState() => _M30State();
}

class _M30State extends State<M30> {
  String _avatar = 'assets/image.png';
  String _fio = 'Петров-Васечкин Александр Александрович';
  String _current = '31.12.2020';
  String _balance = '3 550.00';
  double _avatarWidth = 80.0;
  double _avatarHeight = 80.0;
  double _avatarRadius = 50.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              width: _avatarWidth,
              height: _avatarHeight,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: new Offset(0.0, 5.0),
                    blurRadius: 5.0,
                  )
                ],
                color: Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage(_avatar),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(_avatarRadius)),
              ),
            ),
          ),
          SizedBox(width: 30.0),
          Flexible(
            child: Text(_fio, style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      ),
      SizedBox(height: 20.0),
      Text('current_tariff_plan'.tr + ' ' + _current,
          style: Theme.of(context).textTheme.bodyText2),
      SizedBox(height: 10.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.grey, border: BorderTheme.button),
          title: TitleString(
            title: 'buisness'.tr,
            upperCase: true,
            textStyle: Theme.of(context)
                .textTheme
                .button
                .merge(TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          )),
      SizedBox(height: 10.0),
      Text('current balance'.tr, style: Theme.of(context).textTheme.bodyText2),
      SizedBox(height: 10.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.grey, border: BorderTheme.button),
          title: TitleString(
            title: _balance + ' Р',
            upperCase: true,
            textStyle: Theme.of(context)
                .textTheme
                .button
                .merge(TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          )),
      SizedBox(height: 15.0),
      Text('method_payment_subscription'.tr,
          style: Theme.of(context).textTheme.bodyText2),
      SizedBox(height: 5.0),
      Text('expense_company'.tr,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .merge(TextStyle(fontWeight: FontWeight.bold))),
      SizedBox(height: 10.0),
      Text('method_payment_calling'.tr,
          style: Theme.of(context).textTheme.bodyText2),
      SizedBox(height: 5.0),
      Text('expense_company'.tr,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .merge(TextStyle(fontWeight: FontWeight.bold))),
      SizedBox(height: 15.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.yellow, border: BorderTheme.button),
          title: TitleString(
            title: 'up_balance'.tr,
            upperCase: true,
            textStyle: Theme.of(context).textTheme.button,
          )),
      SizedBox(height: 10.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.yellow, border: BorderTheme.button),
          title: TitleString(
            title: 'change_personal_information'.tr,
            upperCase: true,
            textStyle: Theme.of(context).textTheme.button,
          )),
      SizedBox(height: 10.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.yellow, border: BorderTheme.button),
          title: TitleString(
            title: 'contact_information'.tr,
            upperCase: true,
            textStyle: Theme.of(context).textTheme.button,
          )),
      SizedBox(height: 10.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.yellow, border: BorderTheme.button),
          title: TitleString(
            title: 'pin_code'.tr,
            upperCase: true,
            textStyle: Theme.of(context).textTheme.button,
          )),
      SizedBox(height: 10.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.yellow, border: BorderTheme.button),
          title: TitleString(
            title: 'contactus'.tr,
            upperCase: true,
            textStyle: Theme.of(context).textTheme.button,
          )),
      SizedBox(height: 10.0),
      TitanBox(
          onTap: (value1, value2, value3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.grey, border: BorderTheme.button),
          title: TitleString(title: 'close'.tr, upperCase: true)),
    ]);
  }
}
