import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class M11 extends StatefulWidget {
  @override
  _M11State createState() => _M11State();
}

class _M11State extends State<M11> {
  @override
  Widget build(BuildContext context) {
    var titanButtonStandart = TitanButtonStyle();

    titanButtonStandart.colors[14] = Colors.black;
    titanButtonStandart.colors[15] = Colors.black;
    titanButtonStandart.textShadowx = 0;
    titanButtonStandart.textShadowy = 0;
    titanButtonStandart.intensity = 0;
    titanButtonStandart.showShadow = false;

    return Center(
      child: FlatButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Color.fromRGBO(233, 200, 45, 1),
                    centerTitle: true,
                    title: Text(
                      "СПИСОК ПОЛЬЗОВАТЕЛЕЙ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: TextField(),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Container(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                  minWidth: MediaQuery.of(context).size.width * 0.5,
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                  maxHeight: MediaQuery.of(context).size.width * 0.13,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                              top: MediaQuery.of(context).size.width * 0.020,
                                              left: MediaQuery.of(context).size.width * 0.009,
                                            ),
                                            child: Text(
                                              "Иванов Иван",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context).size.width * 0.050,
                                            ),
                                            child: Text("Директор")),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    TitanButton(
                                      //pressTap: () => pressSave(),
                                      icon: Icons.chat_outlined,
                                      style: titanButtonStandart,
                                      width: 45.0,
                                      height: 100.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                  minWidth: MediaQuery.of(context).size.width * 0.5,
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                  maxHeight: MediaQuery.of(context).size.width * 0.13,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                              top: MediaQuery.of(context).size.width * 0.020,
                                              left: MediaQuery.of(context).size.width * 0.009,
                                            ),
                                            child: Text(
                                              "Иванов Иван",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context).size.width * 0.050,
                                            ),
                                            child: Text("Директор")),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    TitanButton(
                                      //pressTap: () => pressSave(),
                                      icon: Icons.chat_outlined,
                                      style: titanButtonStandart,
                                      width: 45.0,
                                      height: 100.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                  minWidth: MediaQuery.of(context).size.width * 0.5,
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                  maxHeight: MediaQuery.of(context).size.width * 0.13,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                              top: MediaQuery.of(context).size.width * 0.020,
                                              left: MediaQuery.of(context).size.width * 0.009,
                                            ),
                                            child: Text(
                                              "Иванов Иван",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context).size.width * 0.050,
                                            ),
                                            child: Text("Директор")),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    TitanButton(
                                      //pressTap: () => pressSave(),
                                      icon: Icons.chat_outlined,
                                      style: titanButtonStandart,
                                      width: 45.0,
                                      height: 100.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                  minWidth: MediaQuery.of(context).size.width * 0.5,
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                  maxHeight: MediaQuery.of(context).size.width * 0.13,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                              top: MediaQuery.of(context).size.width * 0.020,
                                              left: MediaQuery.of(context).size.width * 0.009,
                                            ),
                                            child: Text(
                                              "Иванов Иван",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context).size.width * 0.050,
                                            ),
                                            child: Text("Директор")),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    TitanButton(
                                      //pressTap: () => pressSave(),
                                      icon: Icons.chat_outlined,
                                      style: titanButtonStandart,
                                      width: 45.0,
                                      height: 100.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                  minWidth: MediaQuery.of(context).size.width * 0.5,
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                  maxHeight: MediaQuery.of(context).size.width * 0.13,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                              top: MediaQuery.of(context).size.width * 0.020,
                                              left: MediaQuery.of(context).size.width * 0.009,
                                            ),
                                            child: Text(
                                              "Иванов Иван",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context).size.width * 0.050,
                                            ),
                                            child: Text("Директор")),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    TitanButton(
                                      //pressTap: () => pressSave(),
                                      icon: Icons.chat_outlined,
                                      style: titanButtonStandart,
                                      width: 45.0,
                                      height: 100.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.02,
                        ),
                        TitanButton(
                          width: MediaQuery.of(context).size.width * 0.5,
                          //pressTap: () => pressSave(),
                          headButton: "ОТМЕНИТЬ",
                          style: titanButtonStandart,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Text("press"),
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                ListTile(
                  leading: new Icon(Icons.phone),
                  title: new Text('Позвонить'),
                  onTap: () => {},
                ),
                Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.width * 0.005,
                ),
                ListTile(
                  leading: new Icon(Icons.chat),
                  title: new Text('Написать сообщение'),
                  onTap: () => {},
                ),
                Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.width * 0.005,
                ),
                ListTile(
                  leading: new Icon(Icons.camera_alt),
                  title: new Text('Камера'),
                  onTap: () => {},
                ),
                Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.width * 0.005,
                ),
                ListTile(
                  leading: new Icon(Icons.photo),
                  title: new Text('Галерея'),
                  onTap: () => {},
                ),
                Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.width * 0.005,
                ),
                ListTile(
                  leading: new Icon(Icons.dock),
                  title: new Text('Документ'),
                  onTap: () => {},
                ),
                Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.width * 0.005,
                ),
                ListTile(
                  leading: new Icon(Icons.location_on),
                  title: new Text('Место положение'),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        );
      });
}
