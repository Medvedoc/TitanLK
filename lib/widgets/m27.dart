import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton%20copy.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class M27 extends StatefulWidget {
  @override
  _M30State createState() => _M30State();
}

class _M30State extends State<M27> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('ОСТАТОК СРЕДСТВ'.toUpperCase(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      SizedBox(height: 5.0),
      Text('НА СЧЁТЕ'.toUpperCase(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      SizedBox(height: 15.0),
      TitanToogleAccordion(
        borderRadius: 6.0,
        textAlign: AlignmentDirectional.center,
        background: Color.fromRGBO(245, 0, 0, 1),
        border: Borderic.all(),
        textHeading: '50.00 Р'.toUpperCase(),
        types: Toogle.zero,
        textStyle: TextStyle(color: Colors.white, fontSize: 24),
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
                Text(
                  'Услуга',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  'активирована',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  'до',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 15.0),
                TitanToogleAccordion(
                  padding: EdgeInsets.zero,
                  borderRadius: 6.0,
                  textAlign: AlignmentDirectional.center,
                  background: Colors.grey.shade200,
                  border: Borderic.all(),
                  textHeading: '31.12.2020'.toUpperCase(),
                  types: Toogle.zero,
                  textStyle: TextStyle(color: Colors.black, fontSize: 24),
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
                Text(
                  'Доступное',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  'количество',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  'вызовов',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 15.0),
                TitanToogleAccordion(
                  padding: EdgeInsets.zero,
                  borderRadius: 6.0,
                  textAlign: AlignmentDirectional.center,
                  background: Color.fromRGBO(245, 0, 0, 1),
                  border: Borderic.all(),
                  textHeading: '0'.toUpperCase(),
                  types: Toogle.zero,
                  textStyle: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 50.0),
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
                child: Image.asset('assets/!.png', color: Colors.red, height: 80.0),
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Text(
                      'Недостаточное количество средств на балансе для дальнейшего оказания услуги',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 50.0),
      TitanButton2(
        headButton: "ПОПОЛНИТЬ БАЛАНС",
        controlStyle: TitanControlStyle(),
      ),
      SizedBox(height: 10.0),
      TitanButton2(
        headButton: "Закрыть",
        controlStyle: TitanControlStyle(),
        types: Types.grey,
      ),
    ]);
  }
}
