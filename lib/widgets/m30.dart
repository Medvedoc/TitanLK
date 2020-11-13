import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton%20copy.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class M30 extends StatefulWidget {
  @override
  _M30State createState() => _M30State();
}

class _M30State extends State<M30> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
      TitanButton2(
        //iconButton: FontAwesomeIcons.timesCircle,
        iconButton: Icons.ac_unit,
        timer:true,
        headButton: "НАСТРОЙКА ПРОФИЛЯ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.red,
      ),
      SizedBox(height: 10.0),
      /*TitanButton(
        headButton: "НАСТРОЙКА ПРОФИЛЯ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.yellow,
      ),
      SizedBox(height: 10.0),
      TitanButton(
        headButton: "НАСТРОЙКА ПРОФИЛЯ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.red,
      ),
      SizedBox(height: 10.0),
      TitanButton(
        headButton: "НАСТРОЙКА ПРОФИЛЯ",
        //pressTap: () => pressSave(),
        controlStyle: TitanControlStyle(),
        types: Types.grey,
      ),*/
      SizedBox(height: 20),
      /*AnimatedButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              SizedBox(width: 6),
              Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {},
        shadowDegree: ShadowDegree.light,
        color: Colors.green,
      ),
      SizedBox(height: 20),
      AnimatedButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            ],
          ),
        ),
        onPressed: () {},
        shadowDegree: ShadowDegree.light,
        color: Colors.amber[400],
      ),*/
      SizedBox(height: 20),
    ]);
  }
}
