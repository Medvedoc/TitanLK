import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitanCheckBox2 extends StatefulWidget {

  
  const TitanCheckBox2({
    Key key,
    this.abc, this.callback,this.isChecked11,
    this.checkedWidget,
    this.uncheckedWidget,
    this.checkedColor,
    this.uncheckedColor,
    this.borderColor,
    this.size,
    this.animationDuration,
    
    @required this.onTap,
  })  : assert(onTap != null),
        super(key: key);
final bool abc;
  final Function(bool) callback;
  final bool isChecked11;
  final Widget checkedWidget;
  final Widget uncheckedWidget;
  final Color checkedColor;
  final Color uncheckedColor;
  final Color borderColor;
  final double size;
  final Function(bool) onTap;
  final Duration animationDuration;

  @override
  _TitanCheckBox2State createState() => _TitanCheckBox2State();
}

class _TitanCheckBox2State extends State<TitanCheckBox2> {
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
    isChecked = widget.isChecked11!=null?widget.isChecked11:false;
    animationDuration = widget.animationDuration ?? Duration(milliseconds: 50);
    size = widget.size ?? 20.0;
    checkedColor = widget.checkedColor ?? Colors.black;
    uncheckedColor = widget.uncheckedColor ?? Colors.white;
    borderColor = widget.borderColor ?? Colors.black;
    checkedWidget = widget.checkedWidget ??
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size:18.0,
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
        //isChecked=widget.isChecked;
          isChecked = !isChecked;
        widget.callback(isChecked);
        });
        widget?.onTap(isChecked);
      },
      child: AnimatedContainer(
        duration: animationDuration,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: isChecked ? checkedColor : uncheckedColor,
          border: Border.all(
            color: borderColor,
            width:1.5,
          ),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: isChecked ? checkedWidget : uncheckedWidget,
      ),
    );
  }
}
