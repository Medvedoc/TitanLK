import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanButton%20copy.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class M30b extends StatefulWidget {
  final TitanControlStyle controlStyle;
  M30b({this.controlStyle});

  @override
  _M30bState createState() => _M30bState();
}

class _M30bState extends State<M30b> {
  String _avatar = 'assets/image.png';
  String _fio = 'Петров-Васечкин Александр Александрович';
  String _current = '31.12.2020';
  String _balance = '50.00';
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
          style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(color: Colors.red))),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: "БИЗНЕС",
        textStyle: Theme.of(context).textTheme.button.merge(
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
        pressTap: () {},
        controlStyle: TitanControlStyle(),
        types: Types.grey,
      ),
      SizedBox(height: 10.0),
      Text('current balance'.tr, style: Theme.of(context).textTheme.bodyText2),
      SizedBox(height: 10.0),
      TitanButton2(
        iconTextRight: FontAwesomeIcons.rubleSign,
        iconSize: 18.0,
        textStyle: Theme.of(context).textTheme.button.merge(
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
        headButton: _balance,
        pressTap: () {},
        controlStyle: TitanControlStyle(),
        types: Types.red,
      ),
      SizedBox(height: 15.0),
      Text('method_payment_subscription'.tr,
          style: Theme.of(context).textTheme.bodyText2),
      SizedBox(height: 5.0),
      Text('expense_company'.tr,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .merge(TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),
      SizedBox(height: 10.0),
      Text('method_payment_calling'.tr,
          style: Theme.of(context).textTheme.bodyText2),
      SizedBox(height: 5.0),
      Text('expense_company'.tr,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .merge(TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),
      SizedBox(height: 15.0),
      TitanButton2(
        headButton: 'up_balance'.tr,
        pressTap: () {},
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: 'change_personal_information'.tr,
        pressTap: () {},
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: 'contact_information'.tr,
        pressTap: () {},
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: 'pin_code'.tr,
        pressTap: () {},
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: 'contactus'.tr,
        pressTap: () {},
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: 'close'.tr,
        pressTap: () {},
        controlStyle: TitanControlStyle(),
        types: Types.grey,
      ),
    ]);
  }
}
