import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton%20copy.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
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
        onPressed: () {},
        style: Decorations(
          height: 65,
            borderRadius: 6.0,
            background: ColorTheme.coloris(color: Color.fromRGBO(245, 0, 0, 1), textColor: Colors.white, shadowColor: Colors.grey.shade200),
            border: BorderTheme(borderRadius: 6.0, borderColor: Colors.black, left:1.5, right: 1.5,bottom: 1.5,top: 1.5)),
        title: TitleString(
          title: '50.00 Р',
          upperCase: true,
          textStyle: Theme.of(context)
              .textTheme
              .headline1
              .merge(TextStyle(color: Colors.white)),
        ),
      ),
      SizedBox(height: 15.0),
      TitanToogleAccordion(
        borderRadius: 6.0,
        textAlign: AlignmentDirectional.center,
        background: Color.fromRGBO(245, 0, 0, 1),
        border: Borderic.all(),
        textHeading: _balance.toUpperCase() + ' Р',
        types: Toogle.zero,
        textStyle: Theme.of(context)
            .textTheme
            .headline1
            .merge(TextStyle(color: Colors.white)),
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
                TitanToogleAccordion(
                    padding: EdgeInsets.zero,
                    borderRadius: 6.0,
                    textAlign: AlignmentDirectional.center,
                    background: Colors.grey.shade200,
                    border: Borderic.all(),
                    textHeading: _date.toUpperCase(),
                    types: Toogle.zero,
                    textStyle: Theme.of(context).textTheme.headline1),
                    
      TitanBox(
        
        type: Type.button(),
        //onPressed: () {},
        style: Decorations(
          height: 45,
            borderRadius: 6.0,
            background: ColorTheme.coloris(color: Color.fromRGBO(245, 0, 0, 1), textColor: Colors.white, shadowColor: Colors.grey.shade200),
            border: BorderTheme(borderRadius: 6.0, borderColor: Colors.black, left:1.5, right: 1.5,bottom: 1.5,top: 1.5)),
        title: TitleString(
          title: '50.00 Р',
          upperCase: true,
          textStyle: Theme.of(context)
              .textTheme
              .headline1
              .merge(TextStyle(color: Colors.white)),
        ),
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
                TitanToogleAccordion(
                  padding: EdgeInsets.zero,
                  borderRadius: 6.0,
                  textAlign: AlignmentDirectional.center,
                  background: Color.fromRGBO(245, 0, 0, 1),
                  border: Borderic.all(),
                  textHeading: _counter.toUpperCase(),
                  types: Toogle.zero,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline1
                      .merge(TextStyle(color: Colors.white)),
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
      TitanButton2(
        headButton: 'up_balance'.tr,
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        pressTapDown: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        ),
        headButton: 'close'.tr,
        controlStyle: TitanControlStyle(),
        types: Types.grey,
      ),
    ]);
  }
}
