import 'package:flutter/material.dart';

class N6 extends StatefulWidget {
  @override
  _N6State createState() => _N6State();
}

class _N6State extends State<N6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "Выбор Договора",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Поиск',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.text_rotation_down,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              ExpansionTile(
                title: Row(
                  children: [Text('№112348'), SizedBox()],
                ),
                children: [],
              ),
              ExpansionTile(
                title: Row(
                  children: [Text('№112348'), SizedBox()],
                ),
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
