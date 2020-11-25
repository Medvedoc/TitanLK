import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/locale/Translations.dart';
import 'package:flutter_image/page/mainPage.dart';
import 'theme/themeStyle.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = GetMaterialApp(
      locale: Locale('ru', 'RU'),
      translations: Translation(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CompanyColors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.blueAccent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.blueAccent[100],
            unselectedItemColor: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          headline1: TextStyle(
            fontSize: 24.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
          headline2: TextStyle(
            fontSize: 18.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 1.40,
            letterSpacing: 1.0,
          ),
          headline3: TextStyle(
            fontSize: 18.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
          headline4: TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
          button: TextStyle(
            fontSize: 19.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            height: 1.40,
          ),
          caption: TextStyle(
            fontSize: 18.0,
            color: Color.fromRGBO(33, 32, 30, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 1.40,
          ),

          /*headline1:TextStyle
          headline2:TextStyle 
          headline3:TextStyle 
          headline4:TextStyle 
          headline5:TextStyle 
          headline6:TextStyle 
          subtitle1:TextStyle 
          subtitle2:TextStyle
          bodyText1:TextStyle 
          bodyText2:TextStyle 
          caption:TextStyle
          button:TextStyle
          overline:TextStyle
          display4:TextStyle 
          display3, TextStyle 
          display2, TextStyle 
          display1, TextStyle 
          headline, TextStyle 
          title, TextStyle 
          subhead, TextStyle 
          subtitle, TextStyle 
          body2, TextStyle 
          body1*/

          /*bodyText1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),*/
        ),
        primaryTextTheme: TextTheme(
          headline3: TextStyle(
              color: CompanyColors.blueText[700],
              fontSize: 15,
              fontWeight: FontWeight.bold),
          headline4: TextStyle(
              color: CompanyColors.blueText[600],
              fontSize: 14,
              fontWeight: FontWeight.bold),
          headline5: TextStyle(
            color: CompanyColors.blueText[500],
            fontSize: 12,
          ),
        ),
      ),
      initialRoute: Navigation.mainPage,
      routes: Navigation.getRoutes(),
    );
    return app;
  }
}

class Navigation {
  static String mainPage = '/';

  static Map<String, Widget Function(BuildContext context)> getRoutes() {
    return {
      Navigation.mainPage: (context) => MainPage(),
    };
  }
}

/*import "package:flutter/material.dart";

void main() {
  runApp(new ControlleApp());
}

class ControlleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  bool visibilityTag = false;
  bool visibilityObs = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        visibilityTag = visibility;
      }
      if (field == "obs") {
        visibilityObs = visibility;
      }
    });
  }

  bool isChecked = true;
  bool isChecked2 = true;

  void toggleCheckbox(bool value) {
    isChecked == false
        ? setState(() {
            isChecked = true;
          })
        : setState(() {
            isChecked = false;
          });
  }

  void toggleCheckbox2(bool value) {
    if (isChecked2 == false) {
      setState(() {
        isChecked2 = true;
      });
    } else {
      setState(() {
        isChecked2 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: new Color(0xFF26C6DA)),
      body: new ListView(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Column(
              children: <Widget>[
                !visibilityObs
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              toggleCheckbox(value);
                              _changed(true, "obs");
                            },
                          ),
                          Text("Observation")
                        ],
                      )
                    : Container(),
                !visibilityTag
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: isChecked2,
                            onChanged: (value) {
                              toggleCheckbox2(value);
                              _changed(true, "tag");
                            },
                          ),
                          Text("Tags")
                        ],
                      )
                    : Container(),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                visibilityObs
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              toggleCheckbox(value);
                              _changed(false, "obs");
                            },
                          ),
                          Text("Observation")
                        ],
                      )
                    : Container(),
                visibilityTag
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: isChecked2,
                            onChanged: (value) {
                              toggleCheckbox2(value);
                              _changed(false, "tag");
                            },
                          ),
                          Text("Tags")
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          Text('isChecked $isChecked'),
          Text('isChecked2 $isChecked2'),
        ],
      ),
    );
  }
}*/

/*
import "package:flutter/material.dart";
import 'package:flutter_image/control/ToogleCheckbox.dart';

void main() {
  runApp(new ControlleApp());
}

class ControlleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isChecked;
  bool abc;

  @override
  void initState() {
    super.initState();
    isChecked = false;
    abc = isChecked;
  }

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: new Color(0xFF26C6DA)),
      body: new ListView(
        children: <Widget>[
          Text('$abc'),
          ToogleCheckbox(
            callback: callback,
            isChecked: isChecked,
            number: 1,
            toggleCheckbox: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
*/

//Рабочая версия
/*
import "package:flutter/material.dart";
import 'package:flutter_image/control/ToogleCheckbox.dart';

void main() {
  runApp(new ControlleApp());
}

class ControlleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List<List<dynamic>> stroke = [
    [
      '112348',
      '03.10.2020',
      'ООО “1 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '312348',
      '05.10.2020',
      'ООО “ 6 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '412348',
      '08.10.2020',
      'ООО “9 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '212348',
      '04.10.2020',
      'ООО “44Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
  ];

  List<bool> isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = [false, true, true, true];
  }

  callback(isChecked) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: new Color(0xFF26C6DA)),
      body: 
      ListView(
        children: <Widget>[
          ToogleCheckbox(
            callback: callback,
            isChecked: isChecked,
            textHeading: ['1', '2', '3', '4'],
            toggleCheckbox: () {
              setState(() {});
            },
          ),
          SizedBox(height: 30.0),
          Container(
            alignment: Alignment.center,
            child: Text('$isChecked'),
          )
        ],
      ),
    );
  }
}
*/

/*import "package:flutter/material.dart";
import 'package:flutter_image/control/ToogleCheckbox.dart';

void main() {
  runApp(new ControlleApp());
}

class ControlleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();
  String filter;
  List<String> text;
  List<String> date;
  List<bool> isChecked;
  List<List<dynamic>> stroke = [
    [
      '112348',
      '03.10.2020',
      'ООО “1 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '312348',
      '05.10.2020',
      'ООО “ 6 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '412348',
      '08.10.2020',
      'ООО “9 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '212348',
      '04.10.2020',
      'ООО “44Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
  ];
  @override
  void initState() {
    super.initState();
    isChecked = [true, true, true, true];

    text = [];
    date = [];
    for (var i = 0; i < stroke.length; i++) {
      text.add(stroke[i][0]);
      date.add(stroke[i][1]);
    }


    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();






  }
  callback(isChecked) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: new Color(0xFF26C6DA)),
      body: ToogleCheckbox(
          callback: callback,
          isChecked: isChecked,
          textHeading: text,
          textDate: date,
          toggleCheckbox: () {
            setState(() {});
            /*Text('№ ${stroke[index][0]}'),
                  Text('от ${stroke[index][1]}'),
                  Text(stroke[index][2]),
                  Text(stroke[index][3]),
                  Text(stroke[index][4]),*/
          }),

      /*ListView(
        children: <Widget>[
          
          SizedBox(height: 30.0),
          Container(
            alignment: Alignment.center,
            child: Text('$isChecked'),
          )
        ],
      ),*/
    );
  }
}*/
