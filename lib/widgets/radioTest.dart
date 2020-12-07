import 'package:flutter/material.dart';

class CustomItem extends StatefulWidget {
  final String title;
  final int index;
  final bool isSelected;
  Function(int) selectItem;

  CustomItem(
    this.selectItem, {
    Key key,
    this.title,
    this.index,
    this.isSelected,
  }) : super(key: key);

  _CustomItemState createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("${widget.isSelected ? "true" : "false"}"),
        RaisedButton(
          onPressed: () {
            widget.selectItem(widget.index);
          },
          child: Text("${widget.title}"),
        )
      ],
    );
  }
}
