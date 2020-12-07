import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:flutter_image/page/mainPage.dart';
import 'package:get/get.dart';

class M32 extends StatefulWidget {
  @override
  _M32State createState() => _M32State();
}

class _M32State extends State<M32> {
  int selectedRadio;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  List<List> card = [
    ['КАРТА 0000-0000-0000-0000', false],
    ['КАРТА 0000-0000-0000-0000', false],
    ['КАРТА 0000-0000-0000-0000', false],
    ['КАРТА 0000-0000-0000-0000', false],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('subscription_fee'.tr.toUpperCase(),
            style: Theme.of(context).textTheme.headline2),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          color: Colors.grey.shade200,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('expense_company'.tr.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Transform.scale(
                  scale: 1.1,
                  child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.black,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 120.0,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: card.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TitanBox(
                      type: Type.checkbox(
                          alignment: TypeAlignment.rightblock,
                          switched: card[index][1]),
                      style: Decorations(
                          background: ColorTheme.coloris(
                              color: card[index][1] == true
                                  ? Color.fromRGBO(254, 229, 0, 1)
                                  : Colors.grey.shade200),
                          border: BorderTheme.zero,
                          textAlignment: MainAxisAlignment.start),
                      title: TitleString(
                        title: card[index][0],
                        upperCase: true,
                        textStyle: Theme.of(context).textTheme.headline2,
                      )),
                  SizedBox(height: 5.0)
                ],
              );
            },
          ),
        ),
        SizedBox(height: 15.0),
        Text('payment_group_departure'.tr.toUpperCase(),
            style: Theme.of(context).textTheme.headline2),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          color: Colors.grey.shade200,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('expense_company'.tr.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Transform.scale(
                  scale: 1.1,
                  child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: Colors.black,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 120.0,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: card.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TitanBox(
                      type: Type.checkbox(
                          alignment: TypeAlignment.rightblock,
                          switched: card[index][1]),
                      style: Decorations(
                          background: ColorTheme.coloris(
                              color: card[index][1] == true
                                  ? Color.fromRGBO(254, 229, 0, 1)
                                  : Colors.grey.shade200),
                          border: BorderTheme.zero,
                          textAlignment: MainAxisAlignment.start),
                      title: TitleString(
                        title: card[index][0],
                        upperCase: true,
                        textStyle: Theme.of(context).textTheme.headline2,
                      )),
                  SizedBox(height: 5.0)
                ],
              );
            },
          ),
        ),
        SizedBox(height: 30.0),
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'link_card'.tr, upperCase: true)),
        SizedBox(height: 15.0),
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'family_account'.tr, upperCase: true)),
        SizedBox(height: 15.0),
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'buisness_accaunt'.tr, upperCase: true)),
        SizedBox(height: 15.0),
        TitanBox(
            onTap: (value1, value2, value3) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.grey, border: BorderTheme.button),
            title: TitleString(title: 'cancal'.tr, upperCase: true)),
      ],
    );
  }

  void pressSave() {
    setState(() {});
  }
}
