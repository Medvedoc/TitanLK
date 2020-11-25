import 'package:flutter/material.dart';

class TitanBoxIndicator extends StatefulWidget {
  final List<bool> indication;
  final double indicatorHeight;
  final double indicatorWidth;
  final Color indicatorBackground;
  final Color indicatorBorderColorEnabled;
  final Color indicatorBorderColorDisabled;
  final double indicatorWeight;
  final int indicatorCaunt;
  TitanBoxIndicator({
    this.indication,
    this.indicatorHeight,
    this.indicatorWidth,
    this.indicatorBackground,
    this.indicatorBorderColorEnabled,
    this.indicatorBorderColorDisabled,
    this.indicatorWeight,
    this.indicatorCaunt,
  });

  @override
  _TitanBoxIndicatorState createState() => _TitanBoxIndicatorState();
}

class _TitanBoxIndicatorState extends State<TitanBoxIndicator> {
  int count;
  Color indicatorBorderColorEnabled;
  Color indicatorBorderColorDisabled;
  @override
  Widget build(BuildContext context) {
  indicatorBorderColorEnabled =  widget.indicatorBorderColorEnabled!=null?widget.indicatorBorderColorEnabled:Color.fromRGBO(39, 174, 96, 1);
  indicatorBorderColorDisabled =  widget.indicatorBorderColorDisabled!=null?widget.indicatorBorderColorDisabled:Color.fromRGBO(204, 204, 204, 1);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.indication.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
      count = widget.indicatorCaunt!=null?widget.indicatorCaunt:2;
          return index < count
              ? Container(
                  width: widget.indicatorWidth!=null? widget.indicatorWidth:20.0,
                  height:widget.indicatorHeight!=null? widget.indicatorHeight:20.0,
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    color:widget.indicatorBackground!=null? widget.indicatorBackground:Colors.transparent,
                    border: Border.all(
                        color: widget.indication != null &&
                                widget.indication[index] == true
                            ? indicatorBorderColorEnabled
                            : indicatorBorderColorDisabled,
                        width: widget.indicatorWeight!=null?widget.indicatorWeight: 3.0),
                    shape: BoxShape.circle,
                  ))

              /*CircleAvatar(
                  radius: 10,
                  backgroundColor: widget.indication != null &&
                          widget.indication[index] == true
                      ? Color.fromRGBO(39, 174, 96, 1)
                      : Color.fromRGBO(204, 204, 204, 1),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 8,
                  ),
                )*/
              : SizedBox();
        });
  }
}
