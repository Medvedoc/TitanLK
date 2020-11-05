import 'package:flutter/material.dart';

class N16 extends StatefulWidget {
  @override
  _N16State createState() => _N16State();
}

class _N16State extends State<N16> {
  Color textLockColor = Color.fromRGBO(25, 187, 16, 1);
  Color notActivelock = Color.fromRGBO(204, 204, 204, 1);
  Color notActivestar = Color.fromRGBO(204, 204, 204, 1);
  Color notActivepeople = Color.fromRGBO(204, 204, 204, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7,
        ),
        M0(),
        M0(),
        M0(),
        M0(),
        M0(),
        M0(),
        M0(),
        M0(),
        M0(),
      ],
    );
  }
}

class M0 extends StatefulWidget {
  @override
  _M0State createState() => _M0State();
}

class _M0State extends State<M0> {
  Color textLockColor = Color.fromRGBO(25, 187, 16, 1);
  Color notActivelock = Color.fromRGBO(204, 204, 204, 1);
  Color notActivestar = Color.fromRGBO(204, 204, 204, 1);
  Color notActivepeople = Color.fromRGBO(204, 204, 204, 1);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.96,
            height: 105,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.lock),
                      color: notActivelock,
                      onPressed: () {
                        setState(() {
                          if (notActivelock == Color.fromRGBO(204, 204, 204, 1)) {
                            notActivelock = Colors.green;
                          } else {
                            notActivelock = Color.fromRGBO(204, 204, 204, 1);
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Петровское пос.,(70 км. приозерского ш.)',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 30,
                      color: notActivestar,
                      icon: Icon(Icons.star),
                      onPressed: () {
                        setState(() {
                          if (notActivestar == Color.fromRGBO(204, 204, 204, 1)) {
                            notActivestar = Colors.yellow;
                          } else {
                            notActivestar = Color.fromRGBO(204, 204, 204, 1);
                          }
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Text(
                      '№5000',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Text(
                      'Под охраной',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: notActivelock,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.39,
                    ),
                    IconButton(
                      iconSize: 30,
                      color: notActivepeople,
                      icon: Icon(Icons.people),
                      onPressed: () {
                        setState(() {
                          if (notActivepeople == Color.fromRGBO(204, 204, 204, 1)) {
                            notActivepeople = Colors.blue;
                          } else {
                            notActivepeople = Color.fromRGBO(204, 204, 204, 1);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
