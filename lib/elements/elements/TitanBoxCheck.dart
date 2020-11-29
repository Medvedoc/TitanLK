import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitanBoxCheck extends StatefulWidget {
  const TitanBoxCheck({
    Key key,
    this.checked,
    this.callbackCheckbox,
    this.isChecked11,
    this.checkedWidget,
    this.uncheckedWidget,
    this.checkedColor,
    this.uncheckedColor,
    this.borderColor,
    this.size,
    this.animationDuration,
    this.checkboxIcon,
    this.checkboxIconColor,
    this.checkboxIconSize,
    this.checkboxBorderRadius,
    this.checkboxHeight,
    this.checkboxWidth,
    this.checkboxBorederWidth,
    this.checkboxBorderColor,
    this.checkboxCheckedColor,
    this.checkboxUncheckedColor,
    this.isSelected,
    @required this.onTap,
  })  : assert(onTap != null),
        super(key: key);









  
  final bool isSelected;     
  final bool checked;
  final Function(bool) callbackCheckbox;
  final bool isChecked11;
  final Widget checkedWidget;
  final Widget uncheckedWidget;
  final Color checkedColor;
  final Color uncheckedColor;
  final Color borderColor;
  final double size;
  final Function(bool) onTap;
  final Duration animationDuration;
  final IconData checkboxIcon;
  final Color checkboxIconColor;
  final double checkboxIconSize;
  final double checkboxBorderRadius;
  final double checkboxWidth;
  final double checkboxHeight;
  final double checkboxBorederWidth;
  final Color checkboxBorderColor;
  final Color checkboxCheckedColor;
  final Color checkboxUncheckedColor;

  @override
  _TitanBoxCheckState createState() => _TitanBoxCheckState();
}

class _TitanBoxCheckState extends State<TitanBoxCheck> {
  bool isChecked;
  Duration animationDuration;
  double size;
  Widget checkedWidget;
  Widget uncheckedWidget;
  Color checkedColor;
  Color uncheckedColor;
  Color borderColor;

  @override
  void initState() {
    isChecked = widget.isChecked11 != null ? widget.isChecked11 : true;
    animationDuration = widget.animationDuration ?? Duration(milliseconds: 50);
    checkedColor = widget.checkboxCheckedColor ?? Colors.black;
    uncheckedColor = widget.checkboxUncheckedColor ?? Colors.transparent;
    checkedWidget = Align(
      alignment: Alignment.center,
      child: Icon(
      widget.checkboxIcon!=null? widget.checkboxIcon: Icons.check,
        color:widget.checkboxIconColor!=null? widget.checkboxIconColor:Colors.white,
        size:widget.checkboxIconSize!=null?widget.checkboxIconSize: 18.0,
      ),
    );
    uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.callbackCheckbox(isChecked);
          print(widget.isSelected ? "true" : "false");
        });
        widget?.onTap(isChecked);
      },
      child: AnimatedContainer(
        //margin: widget.padding!=null?widget.padding:EdgeInsets.symmetric(horizontal:5.0),
        duration: animationDuration,
        height: widget.checkboxHeight != null ? widget.checkboxHeight : 22.0,
        width: widget.checkboxWidth != null ? widget.checkboxWidth : 22.0,
        decoration: BoxDecoration(
          color: isChecked ? checkedColor : uncheckedColor,
          border: Border.all(
            color: widget.checkboxBorderColor != null
                ? widget.checkboxBorderColor
                : Colors.black,
            width: widget.checkboxBorederWidth != null
                ? widget.checkboxBorederWidth
                : 1.5,
          ),
          borderRadius: BorderRadius.circular(
              widget.checkboxBorderRadius != null
                  ? widget.checkboxBorderRadius
                  : 2.0),
        ),
        child: isChecked ? checkedWidget : uncheckedWidget,
      ),
    );
  }
}
