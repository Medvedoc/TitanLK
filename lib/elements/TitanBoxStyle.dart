import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Decorations {
  final bool elevation;
  final ColorTheme background;
  final BorderTheme border;
  final double width;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;
  final double borderWeight;
  final double tappedWidth;
  final double tappedOffset;
  final MainAxisAlignment textAlignment;
  final bool switched;
  final Function(bool) onToggleCollapsed;

  const Decorations({
    this.elevation,
    this.background,
    this.border,
    this.width,
    this.height = 54.0,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.borderRadius = 15.0,
    this.borderWeight = 3.5,
    this.tappedWidth = 6.0,
    this.tappedOffset = 0.0,
    this.textAlignment,
    this.switched = false,
    this.onToggleCollapsed,
  });
}

class TitleString {
  final String title;
  final TextStyle textStyle;
  final bool upperCase;

  const TitleString({
    this.title,
    this.textStyle,
    this.upperCase,
  });
}

class SubTitleString {
  final String subtitle;
  final TextStyle textStyle;
  final bool upperCase;

  const SubTitleString({
    this.subtitle,
    this.textStyle,
    this.upperCase,
  });
}

class DialogShow {
  final String title;
  final EdgeInsets padding;
  final double borderRadius;
  final IconDialogShow icon;
  final AlignmentBox alignment;
  DialogShow({
    this.title,
    this.padding,
    this.borderRadius,
    this.icon,
    this.alignment,
  });
}

class IconDialogShow {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxShape shape;
  final double borderWidth;
  final Color borderColor;
  final Color background;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  IconDialogShow({
    this.margin,
    this.padding,
    this.shape,
    this.borderWidth,
    this.borderColor,
    this.background,
    this.icon,
    this.iconColor,
    this.iconSize,
  });
}

class TimerShow {
  final int second;
  final TextStyle textStyle;
  TimerShow({
    this.second,
    this.textStyle,
  });
}

class PickerShow {
  final List<String> time;
  PickerShow({
    this.time,
  });
}

class CounterShow {
  final int title;

  final LinearGradient gradient;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final TextStyle textStyle;
  final AlignmentBox alignment;

  CounterShow({
    this.title,
    this.gradient,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.textStyle,
    this.alignment,
  });
}

class IconsTheme {
  final IconData icons;
  final EdgeInsets padding;
  final AlignmentBox alignment;
  IconsTheme({
    this.icons,
    this.padding,
    this.alignment,
  });
}

class AlignmentBox {
  final int number;
  AlignmentBox({this.number});

  static AlignmentBox leftblock = AlignmentBox(number: 1);
  static AlignmentBox lefttext = AlignmentBox(number: 2);
  static AlignmentBox righttext = AlignmentBox(number: 3);
  static AlignmentBox rightblock = AlignmentBox(number: 4);
}

class ColorTheme {
  final Color textColor;
  final Color color;
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;
  final List<double> stops;
  final Color shadowColor;
  ColorTheme({
    this.textColor,
    this.color,
    this.begin,
    this.end,
    this.colors,
    this.stops,
    this.shadowColor,
  });

  static ColorTheme yellow = ColorTheme(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(237, 212, 3, 1),
      Color.fromRGBO(237, 212, 3, 1),
    ],
    stops: [0.0, 0.5, 0.5, 1.0],
    shadowColor: Color.fromRGBO(118, 106, 2, 1),
    textColor: Colors.black,
  );

  static ColorTheme red = ColorTheme(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(208, 5, 5, 1),
      Color.fromRGBO(208, 5, 5, 1),
    ],
    stops: [0.0, 0.5, 0.5, 1.0],
    shadowColor: Color.fromRGBO(143, 0, 0, 1),
    textColor: Colors.white,
  );
  static ColorTheme grey = ColorTheme(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(241, 241, 241, 1),
      Color.fromRGBO(241, 241, 241, 1),
      Color.fromRGBO(222, 222, 222, 1),
      Color.fromRGBO(222, 222, 222, 1),
    ],
    stops: [0.0, 0.5, 0.5, 1.0],
    shadowColor: Color.fromRGBO(110, 110, 110, 1),
    textColor: Colors.black,
  );

  static ColorTheme _gradients(
    Color textColor,
    Alignment begin,
    Alignment end,
    List<Color> colors,
    List<double> stops,
    Color shadowColor,
  ) =>
      ColorTheme(
        textColor: textColor,
        begin: begin,
        end: end,
        colors: colors,
        stops: stops,
        shadowColor: shadowColor,
      );

  static ColorTheme gradients({
    Color textColor,
    Alignment begin,
    Alignment end,
    List<Color> colors,
    List<double> stops,
    Color shadowColor,
  }) {
    return _gradients(
      textColor,
      begin,
      end,
      colors,
      stops,
      shadowColor,
    );
  }

  static ColorTheme _coloris(
    Color textColor,
    Color color,
    Color shadowColor,
  ) =>
      ColorTheme(
        textColor: textColor,
        color: color,
        shadowColor: shadowColor,
      );

  static ColorTheme coloris({
    Color textColor,
    Color color,
    Color shadowColor,
  }) {
    return _coloris(
      textColor,
      color,
      shadowColor,
    );
  }
}

class BorderTheme {
  final Color borderColor;
  final LinearGradient borderGradient;
  final double top;
  final double right;
  final double bottom;
  final double left;
  final double borderRadius;
  BorderTheme({
    this.borderColor,
    this.borderGradient,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.borderRadius,
  });

  static BorderTheme button = BorderTheme(
    borderGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(112, 112, 112, 1),
        Color.fromRGBO(243, 243, 243, 1),
        Color.fromRGBO(89, 89, 89, 1),
        Color.fromRGBO(193, 193, 193, 1),
      ],
      stops: [0.0, 0.5, 0.5, 1.0],
    ),
    top: 3.0,
    right: 3.0,
    bottom: 3.0,
    left: 3.0,
    borderRadius: 15.0,
  );

  static BorderTheme container = BorderTheme(
    borderColor: Colors.black,
    top: 1.5,
    right: 1.0,
    bottom: 1.0,
    left: 1.0,
    borderRadius: 10.0,
  );

  static BorderTheme all = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 1.0,
    bottom: 1.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme zero = BorderTheme(
    borderColor: Colors.black,
    top: 0.0,
    right: 0.0,
    bottom: 0.0,
    left: 0.0,
    borderRadius: 0.0,
  );

  static BorderTheme trbz = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 1.0,
    bottom: 1.0,
    left: 0.0,
    borderRadius: 0.0,
  );

  static BorderTheme zrbl = BorderTheme(
    borderColor: Colors.black,
    top: 0.0,
    right: 1.0,
    bottom: 1.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme tzbl = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 0.0,
    bottom: 1.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme trzl = BorderTheme(
    borderColor: Colors.black,
    top: 1.0,
    right: 1.0,
    bottom: 0.0,
    left: 1.0,
    borderRadius: 0.0,
  );

  static BorderTheme _gradients(
    LinearGradient borderGradient,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  ) =>
      BorderTheme(
        borderGradient: borderGradient,
        top: top,
        right: right,
        bottom: bottom,
        left: left,
        borderRadius: borderRadius,
      );

  static BorderTheme gradients({
    LinearGradient borderGradient,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  }) {
    return _gradients(
      borderGradient,
      top,
      right,
      bottom,
      left,
      borderRadius,
    );
  }

  static BorderTheme _colors(
    Color borderColor,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  ) =>
      BorderTheme(
        borderColor: borderColor,
        top: top,
        right: right,
        bottom: bottom,
        left: left,
        borderRadius: borderRadius,
      );

  static BorderTheme colors({
    Color borderColor,
    double top,
    double right,
    double bottom,
    double left,
    double borderRadius,
  }) {
    return _colors(
      borderColor,
      top,
      right,
      bottom,
      left,
      borderRadius,
    );
  }
}

/*class Type {
  final int number;
  Type({this.number});

  static Type button = Type(number: 1);
  static Type container = Type(number: 2);
}*/

class TypeAlignment {
  final int number;
  TypeAlignment({this.number});

  static TypeAlignment leftblock = TypeAlignment(number: 1);
  static TypeAlignment rightblock = TypeAlignment(number: 2);
}

class Variable {
  final int number;
  Variable({this.number});
  static Variable buttons = Variable(number: 1);
  static Variable toogle = Variable(number: 2);
  static Variable checkboxs = Variable(number: 3);
  static Variable indicators = Variable(number: 4);
  static Variable container = Variable(number: 5);
}

class Type {
  final double padding;
  final ValueChanged<bool> onTap;
  final Variable type;
  final TypeAlignment alignment;
  final IconData arrowUp;
  final IconData arrowDown;
  final Color arrowColor;
  final double arrowSize;
  final Color toggleColor;
  final Color toggleActiveColor;
  final Color toggleInactiveColor;
  final double toggleWidth;
  final double toggleHeight;
  final double toggleSize;
  final double toggleBorderRadius;
  final double togglePadding;
  final bool toggleSwitched;
  final double checkboxHeight;
  final double checkboxWidth;
  final Color checkboxCheckedColor;
  final Color checkboxUncheckedColor;
  final Color checkboxBorderColor;
  final double checkboxBorederWidth;
  final double checkboxBorderRadius;
  final IconData checkboxIcon;
  final Color checkboxIconColor;
  final double checkboxIconSize;
  final double indicatorWidth;
  final double indicatorHeight;
  final Color indicatorBackground;
  final Color indicatorBorderColorEnabled;
  final Color indicatorBorderColorDisabled;
  final double indicatorWeight;
  final int indicatorCaunt;
  bool switched;
  Type({
    this.padding,
    @required this.onTap,
    this.type,
    this.alignment,
    this.arrowUp,
    this.arrowDown,
    this.arrowColor,
    this.arrowSize,
    this.toggleColor,
    this.toggleActiveColor,
    this.toggleInactiveColor,
    this.toggleWidth,
    this.toggleHeight,
    this.toggleSize,
    this.toggleBorderRadius,
    this.togglePadding,
    this.toggleSwitched = false,
    this.checkboxHeight,
    this.checkboxWidth,
    this.checkboxCheckedColor,
    this.checkboxUncheckedColor,
    this.checkboxBorderColor,
    this.checkboxBorederWidth,
    this.checkboxBorderRadius,
    this.checkboxIcon,
    this.checkboxIconColor,
    this.checkboxIconSize,
    this.indicatorWidth,
    this.indicatorHeight,
    this.indicatorBackground,
    this.indicatorBorderColorEnabled,
    this.indicatorBorderColorDisabled,
    this.indicatorWeight,
    this.indicatorCaunt,
    this.switched,
  });

  static Type _container(
    TypeAlignment alignment,
    bool switched,
    IconData arrowUp,
    IconData arrowDown,
    Color arrowColor,
    double arrowSize,
    Variable type,
  ) =>
      Type(
        alignment: alignment,
        switched: switched,
        arrowUp: arrowUp,
        arrowDown: arrowDown,
        arrowColor: arrowColor,
        arrowSize: arrowSize,
        type: type = Variable.container,
      );

  static Type container({
    TypeAlignment alignment,
    bool switched,
    IconData arrowUp,
    IconData arrowDown,
    Color arrowColor,
    double arrowSize,
    Variable type,
  }) {
    return _container(
      alignment,
      switched,
      arrowUp,
      arrowDown,
      arrowColor,
      arrowSize,
      type = Variable.container,
    );
  }

  static Type _button(
    ValueChanged<bool> onTap,
    TypeAlignment alignment,
    bool switched,
    IconData arrowUp,
    IconData arrowDown,
    Color arrowColor,
    double arrowSize,
    Variable type,
  ) =>
      Type(
        onTap: onTap,
        alignment: alignment,
        switched: switched,
        arrowUp: arrowUp,
        arrowDown: arrowDown,
        arrowColor: arrowColor,
        arrowSize: arrowSize,
        type: type = Variable.buttons,
      );

  static Type button({
    ValueChanged<bool> onTap,
    TypeAlignment alignment,
    bool switched,
    IconData arrowUp,
    IconData arrowDown,
    Color arrowColor,
    double arrowSize,
    Variable type,
  }) {
    return _button(
      onTap,
      alignment,
      switched,
      arrowUp,
      arrowDown,
      arrowColor,
      arrowSize,
      type = Variable.buttons,
    );
  }

  static Type _toogle(
    TypeAlignment alignment,
    double padding,
    bool switched,
    Color toggleColor,
    Color toggleActiveColor,
    Color toggleInactiveColor,
    double toggleWidth,
    double toggleHeight,
    double toggleSize,
    double toggleBorderRadius,
    double togglePadding,
    Variable type,
  ) =>
      Type(
        alignment: alignment,
        padding: padding,
        switched: switched,
        toggleColor: toggleColor,
        toggleActiveColor: toggleActiveColor,
        toggleInactiveColor: toggleInactiveColor,
        toggleWidth: toggleWidth,
        toggleHeight: toggleHeight,
        toggleSize: toggleSize,
        toggleBorderRadius: toggleBorderRadius,
        togglePadding: togglePadding,
        type: type = Variable.toogle,
      );

  static Type toogle({
    TypeAlignment alignment,
    double padding,
    bool switched,
    Color toggleColor,
    Color toggleActiveColor,
    Color toggleInactiveColor,
    double toggleWidth,
    double toggleHeight,
    double toggleSize,
    double toggleBorderRadius,
    double togglePadding,
    Variable type,
  }) {
    return _toogle(
      alignment,
      padding,
      switched,
      toggleColor,
      toggleActiveColor,
      toggleInactiveColor,
      toggleWidth,
      toggleHeight,
      toggleSize,
      toggleBorderRadius,
      togglePadding,
      type = Variable.toogle,
    );
  }

  static Type _checkbox(
    Function(bool) onTap,
    TypeAlignment alignment,
    double padding,
    bool switched,
    double checkboxHeight,
    double checkboxWidth,
    Color checkboxCheckedColor,
    Color checkboxUncheckedColor,
    Color checkboxBorderColor,
    double checkboxBorederWidth,
    double checkboxBorderRadius,
    IconData checkboxIcon,
    Color checkboxIconColor,
    double checkboxIconSize,
    Variable type,
  ) =>
      Type(
        onTap: onTap,
        alignment: alignment,
        padding: padding,
        switched: switched,
        checkboxHeight: checkboxHeight,
        checkboxWidth: checkboxWidth,
        checkboxCheckedColor: checkboxCheckedColor,
        checkboxUncheckedColor: checkboxUncheckedColor,
        checkboxBorderColor: checkboxBorderColor,
        checkboxBorederWidth: checkboxBorederWidth,
        checkboxBorderRadius: checkboxBorderRadius,
        checkboxIcon: checkboxIcon,
        checkboxIconColor: checkboxIconColor,
        checkboxIconSize: checkboxIconSize,
        type: type = Variable.checkboxs,
      );

  static Type checkbox({
    Function(bool) onTap,
    TypeAlignment alignment,
    double padding,
    bool switched,
    double checkboxHeight,
    double checkboxWidth,
    Color checkboxCheckedColor,
    Color checkboxUncheckedColor,
    Color checkboxBorderColor,
    double checkboxBorederWidth,
    double checkboxBorderRadius,
    IconData checkboxIcon,
    Color checkboxIconColor,
    double checkboxIconSize,
    Variable type,
  }) {
    return _checkbox(
      onTap,
      alignment,
      padding,
      switched,
      checkboxHeight,
      checkboxWidth,
      checkboxCheckedColor,
      checkboxUncheckedColor,
      checkboxBorderColor,
      checkboxBorederWidth,
      checkboxBorderRadius,
      checkboxIcon,
      checkboxIconColor,
      checkboxIconSize,
      type = Variable.checkboxs,
    );
  }

  static Type _indicator(
    TypeAlignment alignment,
    double padding,
    double indicatorHeight,
    double indicatorWidth,
    Color indicatorBackground,
    Color indicatorBorderColorEnabled,
    Color indicatorBorderColorDisabled,
    int indicatorCaunt,
    double indicatorWeight,
    Variable type,
  ) =>
      Type(
        alignment: alignment,
        padding: padding,
        indicatorHeight: indicatorHeight,
        indicatorWidth: indicatorWidth,
        indicatorBackground: indicatorBackground,
        indicatorBorderColorEnabled: indicatorBorderColorEnabled,
        indicatorBorderColorDisabled: indicatorBorderColorDisabled,
        indicatorCaunt: indicatorCaunt,
        indicatorWeight: indicatorWeight,
        type: type = Variable.indicators,
      );

  static Type indicator({
    TypeAlignment alignment,
    double padding,
    double indicatorHeight,
    double indicatorWidth,
    Color indicatorBackground,
    Color indicatorBorderColorEnabled,
    Color indicatorBorderColorDisabled,
    int indicatorCaunt,
    double indicatorWeight,
    Variable type,
  }) {
    return _indicator(
      alignment,
      padding,
      indicatorHeight,
      indicatorWidth,
      indicatorBackground,
      indicatorBorderColorEnabled,
      indicatorBorderColorDisabled,
      indicatorCaunt,
      indicatorWeight,
      type = Variable.indicators,
    );
  }
}
