import 'package:flutter/material.dart';

class M11_4_2 extends StatefulWidget {
  @override
  _M11_4_2State createState() => _M11_4_2State();
}

class _M11_4_2State extends State<M11_4_2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text("press"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Wid();
            },
          );
        },
      ),
    );
  }
}

class Wid extends StatefulWidget {
  @override
  _WidState createState() => _WidState();
}

class _WidState extends State<Wid> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(233, 200, 45, 1),
          centerTitle: true,
          title: Expanded(
            child: Text(
              "РЕДАКТИРОВАНИЕ СПИСКА РАЗРЕШЁННЫХ ОБЪЕКТОВ",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              "СПИСОК ОБЪЕКТОВ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Поиск",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.black,
                      value: _isPressed,
                      onChanged: (value) {
                        setState(
                          () {
                            _isPressed = value;
                          },
                        );
                      },
                    ),
                    Text("112345"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                    ),
                    Expanded(
                      child: Text("Ленинградская область, пос.Краснозёрное"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.black,
                      value: _isPressed,
                      onChanged: (value) {
                        setState(
                          () {
                            _isPressed = value;
                          },
                        );
                      },
                    ),
                    Text("112345"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                    ),
                    Expanded(
                      child: Text("Ленинградская область, пос.Краснозёрное"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.black,
                      value: _isPressed,
                      onChanged: (value) {
                        setState(
                          () {
                            _isPressed = value;
                          },
                        );
                      },
                    ),
                    Text("112345"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                    ),
                    Expanded(
                      child: Text("Ленинградская область, пос.Краснозёрное"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.black,
                      value: _isPressed,
                      onChanged: (value) {
                        setState(
                          () {
                            _isPressed = value;
                          },
                        );
                      },
                    ),
                    Text("112345"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                    ),
                    Expanded(
                      child: Text("Ленинградская область, пос.Краснозёрное"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
