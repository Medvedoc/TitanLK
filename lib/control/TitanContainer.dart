import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TitanContainer extends StatefulWidget {
  bool visible;
  double height;
  List<bool> sumPadding;
  List<Widget> children;
  TitanContainer({this.height, this.sumPadding, this.visible, this.children});

  @override
  _TitanContainerState createState() => _TitanContainerState();
}

class _TitanContainerState extends State<TitanContainer> {
  final GlobalKey _cardKey2 = GlobalKey();
  double cardSizeheight2;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition2());
    print('1111 ${widget.visible}');
    print('Анимированный контейнер $cardSizeheight2');

    
    return InkWell(child: AnimatedOpacity(
        opacity: widget.visible ? 1.0 : 0.0,
        //duration: widget.style.duration[0],
        duration: Duration(milliseconds: 100),
        child: AnimatedContainer(
      key: _cardKey2,
          //color: Colors.red,
          //margin: widget.style.edgeInsets[6],
          alignment: Alignment.topCenter,
          height: widget.height,
          //duration: widget.style.duration[1],
          duration: Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn,
          child: ListView(
                    reverse: false,
                    shrinkWrap: true,
            children: widget.children,
          ),
        ),),
    );
  }

  void initState() {
    super.initState();
  }

  getSizeAndPosition2() {
    RenderBox _cardBox2 = _cardKey2.currentContext.findRenderObject();

    if (widget.visible == true) cardSizeheight2 = _cardBox2.size.height;
  }
}
