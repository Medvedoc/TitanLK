import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/page/mainPage.dart';
import 'theme/themeStyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
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
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            headline1: TextStyle(
              fontSize: 18.0,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 0.90,
            ),
            headline2: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0.90,
            ),
            headline3: TextStyle(
              fontSize: 14.0,
              color: Color.fromRGBO(110,110,110,1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0.90,
            ),
            //fontWeight: FontWeight.bold),
            headline4: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            headline5: TextStyle(color: Colors.white, fontSize: 15),
            headline6: TextStyle(color: Colors.white, fontSize: 12),
            button: TextStyle(color: Colors.black, fontSize: 15)),
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
