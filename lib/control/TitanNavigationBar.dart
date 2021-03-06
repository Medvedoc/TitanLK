import 'package:flutter/material.dart';

typedef Widget ItemBuilder(BuildContext context, TitanNavigationBarItem items);

class TitanNavigationBar extends StatefulWidget {
  final List<TitanNavigationBarItem> items;
  final int currentIndex;
  final void Function(int val) onTap;
  final Color selectedBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;
  final double fontSize;
  final double fontHeight;
  final double iconSize;
  final ItemBuilder itemBuilder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double width;

  TitanNavigationBar({
    Key key,
    @required this.items,
    @required this.currentIndex,
    @required this.onTap,
    ItemBuilder itemBuilder,
    this.backgroundColor = const Color.fromRGBO(233, 200, 45, 1.0),
    this.selectedBackgroundColor = const Color.fromRGBO(33, 32, 30, 1.0),
    this.selectedItemColor = const Color.fromRGBO(233, 200, 45, 1.0),
    this.unselectedItemColor = const Color.fromRGBO(33, 32, 30, 1.0),
    this.iconSize = 21.0,
    this.fontSize = 12.0,
    this.fontHeight = 2.00,
    this.margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.padding = const EdgeInsets.only(bottom: 0, top: 0),
    this.width = double.infinity,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        assert(width > 50),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              fontSize: fontSize,
              backgroundColor: backgroundColor,
              currentIndex: currentIndex,
              iconSize: iconSize,
              items: items,
              onTap: onTap,
              selectedBackgroundColor: selectedBackgroundColor,
            ),
        super(key: key);

  @override
  _TitanNavigationBarState createState() => _TitanNavigationBarState();
}

class _TitanNavigationBarState extends State<TitanNavigationBar> {
  List<TitanNavigationBarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: widget.margin,
            child: Container(
              padding: widget.padding,
              /*decoration: BoxDecoration(
                color: widget.backgroundColor,
              ),*/
              width: widget.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: items.map((f) {
                    return widget.itemBuilder(context, f);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val) onTap,
  List<TitanNavigationBarItem> items,
  int currentIndex,
  Color selectedBackgroundColor,
  Color selectedItemColor,
  Color unselectedItemColor,
  Color backgroundColor,
  double fontSize,
  double iconSize,
}) {
  return (BuildContext context, TitanNavigationBarItem item) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: currentIndex == items.indexOf(item) ? selectedBackgroundColor : backgroundColor,
              ),
              child: InkWell(
                onTap: () {
                  onTap(items.indexOf(item));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * (100 / (items.length * 100)),
                  padding: EdgeInsets.symmetric(vertical: 13.0),
                  //height: 64.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        item.icon,
                        color: currentIndex == items.indexOf(item) ? selectedItemColor : unselectedItemColor,
                        height: iconSize,
                        alignment: Alignment.bottomCenter,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        '${item.title}',
                        style: TextStyle(
                            color: currentIndex == items.indexOf(item) ? selectedItemColor : unselectedItemColor,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.45),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class TitanNavigationBarItem {
  final String title;
  final String icon;
  final Widget customWidget;

  TitanNavigationBarItem({
    @required this.icon,
    @required this.title,
    this.customWidget = const SizedBox(),
  });
}
