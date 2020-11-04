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
            headline3: TextStyle(
              color: Colors.black,
              fontSize: 20,
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

/*headline1, 
headline2, 
headline3, 
headline4, 
headline5, 
headline6, 
subtitle1, 
subtitle2,
bodyText1, 
bodyText2, 
caption, 
button, 
overline, 
display4, 
display3, 
display2, 
display1, 
headline, 
title, 
subhead, 
subtitle, 
body2, 
body1*/
        ),
        /*ButtonThemeData buttonTheme
        //String fontFamily, TextTheme textTheme, TextTheme primaryTextTheme, TextTheme accentTextTheme, InputDecorationTheme inputDecorationTheme, IconThemeData iconTheme, IconThemeData primaryIconTheme, IconThemeData accentIconTheme, SliderThemeData sliderTheme, TabBarTheme tabBarTheme, TooltipThemeData tooltipTheme, CardTheme cardTheme, ChipThemeData chipTheme, TargetPlatform platform, MaterialTapTargetSize materialTapTargetSize, bool applyElevationOverlayColor, PageTransitionsTheme pageTransitionsTheme, 
        AppBarTheme appBarTheme,
        BottomAppBarTheme bottomAppBarTheme, 
        ColorScheme colorScheme, 
        DialogTheme dialogTheme, 
        FloatingActionButtonThemeData floatingActionButtonTheme, 
        NavigationRailThemeData navigationRailTheme, 
        Typography typography, 
        ButtonBarThemeData buttonBarTheme, 
        BottomNavigationBarThemeData bottomNavigationBarTheme, 
        TimePickerThemeData timePickerTheme, 
        TextButtonThemeData textButtonTheme, 
        ElevatedButtonThemeData elevatedButtonTheme, 
        OutlinedButtonThemeData outlinedButtonTheme,
         TextSelectionThemeData textSelectionTheme, 
         DataTableThemeData dataTableTheme, */
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
