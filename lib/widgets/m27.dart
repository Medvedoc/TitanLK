import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:flutter_image/page/mainPage.dart';
import 'package:get/get.dart';

class M27 extends StatefulWidget {
  @override
  _M30State createState() => _M30State();
}

class _M30State extends State<M27> {
  String _balance = '50.00';
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
            background: ColorTheme.coloris(color: Color.fromRGBO(245, 0, 0, 1)),
            border: BorderTheme.container),
        title: TitleString(
            title: _balance + ' Р',
            upperCase: true,
            textStyle: Theme.of(context)
                .textTheme
                .headline1
                .merge(TextStyle(color: Colors.white))),
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
                      background: ColorTheme.coloris(
                          color: Color.fromRGBO(245, 0, 0, 1)),
                      border: BorderTheme.container),
                  title: TitleString(
                      title: _counter.toUpperCase(),
                      upperCase: true,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1
                          .merge(TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 50.0),
      Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(0.0, 2.0),
                blurRadius: 5.0,
              )
            ],
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Row(
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('assets/!.png',
                    color: Colors.red, height: 80.0),
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Text('dialog_001'.tr,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1.merge(
                          TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.red))),
                ],
              ),
            ),
          ],
        ),
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
