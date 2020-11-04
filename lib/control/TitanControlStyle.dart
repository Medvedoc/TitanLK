import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitanControlStyle {
  double height = 52.0;
  double weight = 8.0;

  //Тень вокруг кнопки---------------------------------------------------------------
  Color elevationColor = Color.fromRGBO(0, 0, 0, 0.5);
  Offset elevationOffset = Offset(0.0, 2.0);
  double elevationSpread = 0.0;
  double elevationBlur = 6.0;
  //---------------------------------------------------------------------------------

  //Параметры кнопки-----------------------------------------------------------------
  double buttonMarginHorizontal = 0.0;
  double buttonPaddingHorizontal = 5.0;
  //---------------------------------------------------------------------------------

  //Радиус рамки кнопки--------------------------------------------------------------
  double borderRadius = 20.0;
  //---------------------------------------------------------------------------------

  //Градиент кнопки------------------------------------------------------------------
  Color buttonColorBody = Color.fromRGBO(118, 106, 2, 1);
  List<Color> buttonColorGradient = [
    Color.fromRGBO(253, 228, 0, 1),
    Color.fromRGBO(237, 212, 3, 1),
  ];

  Color buttonColorBodyYellow = Color.fromRGBO(118, 106, 2, 1);
  List<Color> buttonColorGradientYellow = [
    Color.fromRGBO(253, 228, 0, 1),
    Color.fromRGBO(237, 212, 3, 1),
  ];

  Color buttonColorBodyRed = Color.fromRGBO(143, 0, 0, 1);
  List<Color> buttonColorGradientRed = [
    Color.fromRGBO(255, 0, 0, 1),
    Color.fromRGBO(208, 5, 5, 1),
  ];

  Color buttonColorBodyGray = Color.fromRGBO(110, 110, 110, 1);
  List<Color> buttonColorGradientGray = [
    Color.fromRGBO(241, 241, 241, 1),
    Color.fromRGBO(222, 222, 222, 1),
  ];

  List<Alignment> buttonAlignmentGradient = [
    Alignment.topCenter,
    Alignment.bottomCenter
  ];
  List<double> buttonPointGradient = [0.0, 0.5, 0.5, 0.0];
  //---------------------------------------------------------------------------------

  //Рамка вокруг кнопки--------------------------------------------------------------
  List<Alignment> borderAlignmentGradient = [
    Alignment.topCenter,
    Alignment.bottomCenter
  ];
  List<Color> borderColorGradient = [
    Color.fromRGBO(112, 112, 112, 1),
    Color.fromRGBO(243, 243, 243, 1),
    Color.fromRGBO(89, 89, 89, 1),
    Color.fromRGBO(193, 193, 193, 1),
  ];
  List<double> borderPointGradient = [0.0, 0.5, 0.5, 1.0];
  double borderWidth = 3.0;
  //---------------------------------------------------------------------------------

  //Стиль иконки --------------------------------------------------------------------
  Color iconColorDark = Color.fromRGBO(33, 32, 30, 1);
  Color iconColorWhite = Color.fromRGBO(255, 255, 255, 1);
  double iconSize = 24.0;
  Color iconShadow = Colors.grey.shade600;
  bool iconShadowVisible = true;
  //---------------------------------------------------------------------------------

  //Стиль текста --------------------------------------------------------------------
  String fontFamily = "Roboto";
  FontWeight fontWeight = FontWeight.w500;
  FontStyle fontStyle = FontStyle.normal;
  double counterFontSize = 14.0;
  double counterHeight = 0.95;
  Color counterColor = Color.fromRGBO(255, 255, 255, 1);
  double textFontSize = 16.0;
  double textHeight = 1.20;
  Color textColorDark = Color.fromRGBO(33, 32, 30, 1);
  Color textColorWhite = Color.fromRGBO(255, 255, 255, 1);
  Color textShadowColor = Color.fromRGBO(118, 106, 2, 0.2);
  double textIntensity = 2.0; //Интенсивность тени текста кнопки
  double textShadowx = -12.0; //смещение тени текста кнопки по оси х
  double textShadowy = -12.0; //смещение тени текста кнопки по оси y
  //---------------------------------------------------------------------------------

  //Градиент счетчика----------------------------------------------------------------
  List<Alignment> counterAlignmentGradient = [
    Alignment.topCenter,
    Alignment.bottomCenter
  ];
  List<Color> counterColorGradient = [
    Color.fromRGBO(116, 106, 18, 1),
    Color.fromRGBO(144, 126, 90, 1),
  ];
  List<double> counterPointGradient = [0.0, 0.3, 0.6, 1.0];
  double counterBorderRadius = 28.0;
  double counterBorderWidth = 2.0;
  Color counterBorderColor = Color.fromRGBO(101, 91, 0, 1);
  //---------------------------------------------------------------------------------

  //Анимация кнопки------------------------------------------------------------------
  int durationAnimation = 300;
  double letterSpacingUp = 3.0;
  double letterSpacingDown = 2.8;
  List<EdgeInsets> weightAnimation = [
    EdgeInsets.only(top: 6.0),
    EdgeInsets.only(top: 0.0),
    EdgeInsets.only(bottom: 0.0),
    EdgeInsets.only(bottom: 6.0)
  ];
  //---------------------------------------------------------------------------------
}
