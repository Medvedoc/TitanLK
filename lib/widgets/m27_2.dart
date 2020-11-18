import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton%20copy.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
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
      TitanToogleAccordion(
        borderRadius: 6.0,
        textAlign: AlignmentDirectional.center,
        background: Colors.grey.shade200,
        border: Borderic.all(),
        textHeading: _balance.toUpperCase() + ' Р',
        types: Toogle.zero,
        textStyle: Theme.of(context).textTheme.headline1,
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
                  background: Colors.grey.shade200,
                  border: Borderic.all(),
                  textHeading: _counter.toUpperCase(),
                  types: Toogle.zero,
                  textStyle: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
        ],
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
