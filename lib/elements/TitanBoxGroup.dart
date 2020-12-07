/*import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBox.dart';

class TitanBoxGroup extends StatefulWidget {
  final List<TitanBox> children;
  TitanBoxGroup({this.children});
  @override
  _TitanBoxGroupState createState() => _TitanBoxGroupState();
}

class _TitanBoxGroupState extends State<TitanBoxGroup> {
  int _selectedItem;
  List<TitanBox> children;
  List<int> variant;
  @override
  void initState() {
    super.initState();
    children = widget.children;
    for (var i = 0; i < children.length; i++) {
      if (children[i].isSelected == true) {
        _selectedItem = children.indexOf(children[i]);
      }
    }
  }

  bool _variable;
  selectItem(index, variable) {
    setState(() {
      _selectedItem = index;
      _variable = variable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children:[ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return TitanBox(
          selectItem: selectItem,
          index: children[index].index,
          //child: children[index].child,
          children: children[index].children,
          isSelected: _selectedItem == children[index].index
              ? (_variable == true ? false : true)
              : false,
          type: children[index].type,
          style:children[index].style,
          title: children[index].title,
          callback: children[index].callback,
        );
      },
    )]);
  }
}*/
