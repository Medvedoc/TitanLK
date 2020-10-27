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
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 124,
          ),
          Card(
            color: isSwitched ? Colors.yellow : Colors.white,
            child: Row(
              children: [
                SizedBox(width: 25),
                Text(
                  'Получать уведомления',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
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
                SizedBox(width: 94),
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
    );
  }
}
