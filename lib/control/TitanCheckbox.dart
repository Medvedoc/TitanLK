import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitanCheckBox extends StatefulWidget {

  
  const TitanCheckBox({
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
  _TitanCheckBoxState createState() => _TitanCheckBoxState();
}

class _TitanCheckBoxState extends State<TitanCheckBox> {
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
    isChecked = true;
    print('isChecked11 $isChecked');
    animationDuration = widget.animationDuration ?? Duration(milliseconds: 50);
    size = widget.size ?? 20.0;
    checkedColor = widget.checkedColor ?? Colors.black;
    uncheckedColor = widget.uncheckedColor ?? Colors.grey.shade300;
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
      //print('1111 $isChecked');
    return GestureDetector(
      onTap: () {
        setState(() {
        widget.callback(isChecked);
        //isChecked=widget.isChecked;
          isChecked = !isChecked;
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
