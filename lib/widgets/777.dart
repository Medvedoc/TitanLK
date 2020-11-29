import 'package:flutter/material.dart';

class CustomItem extends StatefulWidget {
  final Widget titleChild;
  final String content;
  final Widget contentChild;
  final Color collapsedTitleBackgroundColor;
  final Color expandedTitleBackgroundColor;
  final Widget collapsedIcon;
  final Widget expandedIcon;
  final String title;
  final TextStyle textStyle;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final Color contentBackgroundColor;
  final EdgeInsets margin;
  final Border titleBorder;
  final Border contentBorder;
  final BorderRadius titleBorderRadius;
  final BorderRadius contentBorderRadius;
  final Function(bool) onToggleCollapsed;

  final int index;
  final int group;
  final bool isSelected;
  Function(int, int) selectItem;
  bool isChecked;

  CustomItem(this.selectItem,
      {Key key,
      this.title,
      this.index,
      this.group,
      this.isSelected,
      this.isChecked,
      this.titleChild,
      this.content,
      this.collapsedTitleBackgroundColor,
      this.expandedTitleBackgroundColor = const Color(0xFFE0E0E0),
      this.collapsedIcon = const Icon(Icons.keyboard_arrow_down),
      this.expandedIcon = const Icon(Icons.keyboard_arrow_up),
      this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
      this.titlePadding = const EdgeInsets.all(10),
      this.contentBackgroundColor,
      this.contentPadding = const EdgeInsets.all(10),
      this.contentChild,
      this.titleBorder = const Border(),
      this.contentBorder = const Border(),
      this.margin,
      this.onToggleCollapsed,
      this.titleBorderRadius = const BorderRadius.all(Radius.circular(0)),
      this.contentBorderRadius = const BorderRadius.all(Radius.circular(0))})
      : super(key: key);

  _CustomItemState createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController controller;
  Animation<Offset> offset;
  bool showAccordion = false;

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  int group;
  bool isChecked;
  Duration animationDuration;
  double size;
  Widget checkedWidget;
  Widget uncheckedWidget;
  Color checkedColor;
  Color uncheckedColor;
  Color borderColor;
  int counter = 0;

  @override
  void initState() {
    //showAccordion = widget.showAccordion;
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    offset = Tween(
      begin: const Offset(0, -0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    group = widget.group;
    isChecked = widget.isSelected ? true : false;
    animationDuration = Duration(milliseconds: 50);
    checkedColor = Colors.black;
    uncheckedColor = Colors.transparent;
    checkedWidget = Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 18.0,
      ),
    );
    uncheckedWidget = Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 18.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${widget.isSelected ? "true" : "false"}"),
        RaisedButton(
          onPressed: () {
            widget.selectItem(widget.index, widget.group);
            widget.group == group ? print('yes') : print('no');
          },
          child: Text("${widget.title}"),
        ),
        GestureDetector(
          onTap: () {
            print('${widget.index} ${widget.isSelected}');
            setState(() {
              isChecked = widget.isSelected;
              isChecked = true;
              _toggleCollapsed();
              widget.selectItem(widget.index, widget.group);
            });
            if (counter == 1) {
              //  isTapped = false;
              // accordion == true ? isTapped = false : isTapped = true;
              counter -= 1;
              isChecked = false;
              print('yes $counter : ${widget.isSelected}');
              widget.selectItem(widget.index, widget.group);
              //isChecked = !isChecked;
              setState(() {
              isChecked = !isChecked;
              _toggleCollapsed();
            });
            } else {
              counter += 1;
              print('no $counter : ${widget.isSelected}');
              widget.selectItem(widget.index, widget.group);
              setState(() {
              isChecked = !isChecked;
                //isChecked = isChecked;
                //isTapped = !isTapped;
              });
            }
          },
          child: AnimatedContainer(
            //margin: widget.padding!=null?widget.padding:EdgeInsets.symmetric(horizontal:5.0),
            duration: animationDuration,
            //height: widget.checkboxHeight != null ? widget.checkboxHeight : 22.0,
            //width: widget.checkboxWidth != null ? widget.checkboxWidth : 22.0,
            decoration: BoxDecoration(
              color: widget.isSelected ? checkedColor : uncheckedColor,
              border: Border.all(
                color:
                    /*widget.checkboxBorderColor != null
                ? widget.checkboxBorderColor
                : */
                    Colors.black,
                width:
                    /*widget.checkboxBorederWidth != null
                ? widget.checkboxBorederWidth
                : */
                    1.5,
              ),
              borderRadius: BorderRadius.circular(
                  /*widget.checkboxBorderRadius != null
                  ? widget.checkboxBorderRadius
                  :*/
                  2.0),
            ),
            child: widget.isSelected ? checkedWidget : uncheckedWidget,
          ),
        ),
        widget.isSelected == true && showAccordion
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: widget.contentBorderRadius,
                  border: widget.contentBorder,
                  color: widget.contentBackgroundColor ?? Colors.white70,
                ),
                width: MediaQuery.of(context).size.width,
                padding: widget.contentPadding,
                child: SlideTransition(
                  position: offset,
                  child: Text(widget.content),
                ),
              )
            : Container()
      ],
    );
  }

  _toggleCollapsed() {
    setState(() {
      switch (controller.status) {
        case AnimationStatus.completed:
          controller.forward(from: 0);
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        default:
      }
      showAccordion = !showAccordion;
      // showAccordion = !showAccordion;
      if (widget.onToggleCollapsed != null) {
        widget.onToggleCollapsed(showAccordion);
      }
    });
  }
}
