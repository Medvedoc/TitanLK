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
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [Text("asd")],
                            );
                          });
                    },
                    child: ListView(
                      children: [
                        Column(
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
                          ],
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
