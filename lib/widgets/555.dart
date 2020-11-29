import 'package:flutter/material.dart';
import 'package:flutter_image/widgets/777.dart';

class M888 extends StatefulWidget {
  final int group;
  final List<CustomItem> children;

  M888({this.group, this.children
  });

  _CustomItemState createState() => _CustomItemState();
}

class _CustomItemState extends State<M888> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.children);
      
    
  }
}
