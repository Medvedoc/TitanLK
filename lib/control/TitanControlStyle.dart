import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  Color counterColor = Color.fromRGBO(255, 255, 255, 1);
  double textFontSize = 16.0;
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

  //TitanToogle----------------------------------------------------------------------
  EdgeInsets marginDialog = EdgeInsets.only(
      left: 10.0); //Отступ иконки кнопки диалогового окна от текста
  EdgeInsets paddingDialog =
      EdgeInsets.all(5.0); //Отступ иконки кнопки диалогового окна
  Color borderColorDialog = Color.fromRGBO(
      101, 91, 0, 0.5); //Цвет рамки иконки кнопки диалогового окна
  double borderWidthDialog = 2.0; //Ширина рамки иконки кнопки диалогового окна
  Color borderColorIconDialog =
      Color.fromRGBO(254, 229, 0, 1); //Цвет кнопки диалогового окнка
  IconData iconDialog =
      FontAwesomeIcons.question; //Иконка кнопки диалогового окна
  Color iconColorDialog =
      Color.fromRGBO(101, 91, 0, 0.5); //Цвет иконки кнопки диалогового окна
  double sizeIconDialog = 20.0; //Размер иконки кнопки диалогового окна

  BorderRadiusGeometry borderRadiusWindowDialog =
      BorderRadius.circular(20); //Закругление диалогового окна
  EdgeInsets paddingWindowDialog =
      EdgeInsets.all(20); //Внутренние отступы диалогового окна
  //---------------------------------------------------------------------------------

  //FlutterSwitch--------------------------------------------------------------------
  Color switchActiveColor = Colors.black;
  Color switchInactiveColor = Color.fromRGBO(101, 91, 0, 0.4);
  double switchWidth = 40.0;
  double switchHeight = 20.0;
  double switchToggleSize = 18.0;
  double switchBorderRadius = 20.0;
  double switchPadding = 2.0;
  //---------------------------------------------------------------------------------

}

class Borderic {
  static Border buildBorderic(BorderSide top, BorderSide right,
          BorderSide bottom, BorderSide left) =>
      Border(top: top, right: right, bottom: bottom, left: left);

  static Border all({Color color = Colors.black, double width = 1.5}) {
    return buildBorderic(
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
    );
  }

  static Border zero({Color color = Colors.black, double width = 1.5}) {
    return buildBorderic(
      BorderSide.none,
      BorderSide.none,
      BorderSide.none,
      BorderSide.none,
    );
  }

  static Border rbl({Color color = Colors.black, double width = 1.5}) {
    return buildBorderic(
      BorderSide.none,
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
    );
  }

  static Border blt({Color color = Colors.black, double width = 1.5}) {
    return buildBorderic(
      BorderSide(color: color, width: width),
      BorderSide.none,
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
    );
  }

  static Border ltr({Color color = Colors.black, double width = 1.5}) {
    return buildBorderic(
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
      BorderSide.none,
      BorderSide(color: color, width: width),
    );
  }

  static Border trb({Color color = Colors.black, double width = 1.5}) {
    return buildBorderic(
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
      BorderSide(color: color, width: width),
      BorderSide.none,
    );
  }
}

class ButtonGradient {
  static LinearGradient buildLinearGradient(
          AlignmentGeometry begin,
          AlignmentGeometry end,
          List<Color> colors,
          List<double> stops,
          TileMode tileMode) =>
      LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
          stops: stops,
          tileMode: tileMode);

  static LinearGradient yellowUp({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<Color> colors = const [
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(237, 212, 3, 1),
      Color.fromRGBO(237, 212, 3, 1),
    ],
    List<double> stops = const [0.0, 0.5, 0.5, 1.0],
    TileMode tileMode = TileMode.clamp,
  }) {
    return buildLinearGradient(
      begin,
      end,
      colors,
      stops,
      tileMode,
    );
  }

  static LinearGradient yellowDown({
    AlignmentGeometry begin = Alignment.bottomCenter,
    AlignmentGeometry end = Alignment.topCenter,
    List<Color> colors = const [
      Color.fromRGBO(237, 212, 3, 1),
      Color.fromRGBO(237, 212, 3, 1),
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(253, 228, 0, 1),
    ],
    List<double> stops = const [0.0, 0.5, 0.5, 1.0],
    TileMode tileMode = TileMode.clamp,
  }) {
    return buildLinearGradient(
      begin,
      end,
      colors,
      stops,
      tileMode,
    );
  }

  static LinearGradient redUp({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<Color> colors = const [
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(208, 5, 5, 1),
      Color.fromRGBO(208, 5, 5, 1),
    ],
    List<double> stops = const [0.0, 0.5, 0.5, 1.0],
    TileMode tileMode = TileMode.clamp,
  }) {
    return buildLinearGradient(
      begin,
      end,
      colors,
      stops,
      tileMode,
    );
  }

  static LinearGradient redDown({
    AlignmentGeometry begin = Alignment.bottomCenter,
    AlignmentGeometry end = Alignment.topCenter,
    List<Color> colors = const [
      Color.fromRGBO(208, 5, 5, 1),
      Color.fromRGBO(208, 5, 5, 1),
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(255, 0, 0, 1),
    ],
    List<double> stops = const [0.0, 0.5, 0.5, 1.0],
    TileMode tileMode = TileMode.clamp,
  }) {
    return buildLinearGradient(
      begin,
      end,
      colors,
      stops,
      tileMode,
    );
  }

  static LinearGradient greyUp({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<Color> colors = const [
      Color.fromRGBO(241, 241, 241, 1),
      Color.fromRGBO(241, 241, 241, 1),
      Color.fromRGBO(222, 222, 222, 1),
      Color.fromRGBO(222, 222, 222, 1),
    ],
    List<double> stops = const [0.0, 0.5, 0.5, 1.0],
    TileMode tileMode = TileMode.clamp,
  }) {
    return buildLinearGradient(
      begin,
      end,
      colors,
      stops,
      tileMode,
    );
  }

  static LinearGradient greyDown({
    AlignmentGeometry begin = Alignment.bottomCenter,
    AlignmentGeometry end = Alignment.topCenter,
    List<Color> colors = const [
      Color.fromRGBO(222, 222, 222, 1),
      Color.fromRGBO(222, 222, 222, 1),
      Color.fromRGBO(241, 241, 241, 1),
      Color.fromRGBO(241, 241, 241, 1),
    ],
    List<double> stops = const [0.0, 0.5, 0.5, 1.0],
    TileMode tileMode = TileMode.clamp,
  }) {
    return buildLinearGradient(
      begin,
      end,
      colors,
      stops,
      tileMode,
    );
  }
}

class Bla {
  static Color buildBordericS(Color color) => color;

  static Color greyDowns({Color color = Colors.blue}) {
    return buildBordericS(color);
  }
}

class Types {
  static String yellow = 'yellow';
  static String red = 'red';
  static String grey = 'grey';
}

class Toogle {
  static String radio = 'radio';
  static String checkbox = 'checkbox';
  static String toogle = 'toogle';
  static String indicator = 'indicator';
}

class Indication {
  static Widget all = Container(
    alignment: Alignment.centerRight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(39, 174, 96, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
        SizedBox(width: 2.0),
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(39, 174, 96, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
      ],
    ),
  );
  static Widget zero = Container(
    alignment: Alignment.centerRight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(204, 204, 204, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
        SizedBox(width: 2.0),
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(204, 204, 204, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
      ],
    ),
  );
  static Widget first = Container(
    alignment: Alignment.centerRight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(39, 174, 96, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
        SizedBox(width: 2.0),
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(204, 204, 204, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
      ],
    ),
  );
  static Widget second = Container(
    alignment: Alignment.centerRight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(204, 204, 204, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
        SizedBox(width: 2.0),
        CircleAvatar(
          radius: 10,
          backgroundColor: Color.fromRGBO(39, 174, 96, 1),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 8,
          ),
        ),
      ],
    ),
  );
}
