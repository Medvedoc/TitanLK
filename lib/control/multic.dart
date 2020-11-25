import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRadioButton<T> extends StatefulWidget {
  CustomRadioButton({
    this.buttonLables,
    this.buttonValues,
    this.radioButtonValue,
    this.unSelectedColor,
    this.selectedColor,
    this.horizontal = false,
    this.defaultSelected,
  });

  final bool horizontal;
  final List<T> buttonValues;
  final T defaultSelected;
  final List<Widget> buttonLables;
  final void Function(T) radioButtonValue;
  final Color unSelectedColor;
  final Color selectedColor;

  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  Widget _currentSelectedLabel;
  List aaa = [];
  @override
  void initState() {
    super.initState();

    widget.buttonLables.forEach((element) {
      print(widget.buttonLables.indexOf(element));
      aaa.add(widget.buttonLables.indexOf(element));
    });

    print(aaa);
    if (widget.defaultSelected != null) {
      if (aaa.contains(widget.defaultSelected)) {
        int bbb = widget.defaultSelected - 1;
        int index = aaa.indexOf(bbb);
        _currentSelectedLabel = widget.buttonLables[index];
      }
    }
  }

  List<Widget> _buildButtonsColumn() {
    return aaa.map((e) {
      int index = aaa.indexOf(e);
      return GestureDetector(
        child: Card(
          color: _currentSelectedLabel == widget.buttonLables[index]
              ? widget.selectedColor
              : widget.unSelectedColor,
          child: widget.buttonLables[index],
        ),
        onTap: () {
          widget.radioButtonValue(e);
          setState(() {
            
            _currentSelectedLabel = widget.buttonLables[index];
          });
        },
        /*Card(
          color: _currentSelectedLabel == widget.buttonLables[index]
              ? widget.selectedColor
              : widget.unSelectedColor,
          child: Container(
            child: MaterialButton(
              onPressed: () {
                widget.radioButtonValue(e);
                setState(() {
                  _currentSelectedLabel = widget.buttonLables[index];
                });
              },
              child: Center(
                child: Text(
                  widget.buttonLables[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),*/
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: _buildButtonsColumn(),
        ),
      ),
    );
  }
}
