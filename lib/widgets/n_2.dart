import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class N2 extends StatefulWidget {
  @override
  _N2State createState() => _N2State();
}

class _N2State extends State<N2> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [new BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), offset: new Offset(0.0, 4.0), blurRadius: 4.0, spreadRadius: 2.0)],
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            width: double.infinity,
            child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 124,
          ),
          Card(
            color: isSwitched ? Colors.yellow : Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  'Получать уведомления',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                IconButton(
                  disabledColor: Colors.black,
                  iconSize: 30,
                  icon: Icon(
                    FontAwesomeIcons.question,
                    color: Colors.yellow[200],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 16,
                          child: Container(
                            height: 250,
                            width: 125,
                            child: Center(
                              child: Padding(padding: EdgeInsets.all(15), child: Text("TextTextTextTextTextTextTextTextTextTextTextTextText")),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.11,
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  inactiveThumbColor: Colors.blue,
                  inactiveTrackColor: Colors.black,
                  activeTrackColor: Colors.black,
                  activeColor: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
          ),
        );
  }
}
