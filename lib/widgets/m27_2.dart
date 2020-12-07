import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:flutter_image/page/mainPage.dart';
import 'package:get/get.dart';

class M27_2 extends StatefulWidget {
  @override
  _M27_2State createState() => _M27_2State();
}

class _M27_2State extends State<M27_2> {
  String _balance = '3 550.00';
  String _date = '31.12.2020';
  String _counter = '0';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'balance_account'.tr.toUpperCase(),
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 15.0),
      TitanBox(
        type: Type.container(),
        style: Decorations(
            height: 60,
            background: ColorTheme.coloris(color: Colors.grey.shade200),
            border: BorderTheme.container),
        title: TitleString(
            title: _balance + ' Р',
            upperCase: true,
            textStyle: Theme.of(context).textTheme.headline1),
      ),
      SizedBox(height: 40.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('service_activated_before'.tr,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
                SizedBox(height: 15.0),
                TitanBox(
                  type: Type.container(),
                  style: Decorations(
                      height: 45,
                      borderRadius: 6.0,
                      background:
                          ColorTheme.coloris(color: Colors.grey.shade200),
                      border: BorderTheme.container),
                  title: TitleString(
                      title: _date.toUpperCase(),
                      upperCase: true,
                      textStyle: Theme.of(context).textTheme.headline1),
                ),
              ],
            ),
          ),
          SizedBox(width: 15.0),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('available_number_calls'.tr,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
                SizedBox(height: 15.0),
                TitanBox(
                  type: Type.container(),
                  style: Decorations(
                      height: 45,
                      borderRadius: 6.0,
                      background:
                          ColorTheme.coloris(color: Colors.grey.shade200),
                      border: BorderTheme.container),
                  title: TitleString(
                      title: _counter.toUpperCase(),
                      upperCase: true,
                      textStyle: Theme.of(context).textTheme.headline1),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 50.0),
      TitanBox(
          type: Type.button(alignment: TypeAlignment.leftblock),
          style: Decorations(
              background: ColorTheme.yellow, border: BorderTheme.button),
          title: TitleString(title: 'up_balance'.tr, upperCase: true)),
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
