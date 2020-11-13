import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final String textHeading;
  final bool enabled;
  final Color color;
  final double height;
  final double width;
  final ShadowDegree shadowDegree;
  final int duration;

  final IconData icon;

  const AnimatedButton({
    @required this.onPressed,
    @required this.textHeading,
    this.enabled = true,
    this.color = Colors.blue,
    this.height = 64,
    this.shadowDegree = ShadowDegree.light,
    this.width=300,
    this.duration = 70,
    this.icon,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  final GlobalKey _renderKey = GlobalKey();
  double renderWidth;
  static const Curve _curve = Curves.easeIn;
  static const double _shadowHeight = 6;
  double _position = 6;
void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    RenderBox _renderBox = _renderKey.currentContext.findRenderObject();
    renderWidth = _renderBox.size.width;
  }
  @override
  Widget build(BuildContext context) {
    
    print(MediaQuery.of(context).size.width);
    print(renderWidth);
    final double _height = widget.height - _shadowHeight;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: _height + _shadowHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
            key: _renderKey,
                height: _height,
        width: widget.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(118, 106, 2, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: _curve,
              duration: Duration(milliseconds: widget.duration),
              bottom: _position,
              child: Container(
                height: _height,
        width: widget.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
                    colors: [
                      Color.fromRGBO(112, 112, 112, 1),
                      Color.fromRGBO(243, 243, 243, 1),
                      Color.fromRGBO(89, 89, 89, 1),
                      Color.fromRGBO(193, 193, 193, 1),
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20 / 1.5),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(3.0),
                  height: _height,
        width: widget.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.clamp,
                      colors: [
                        Color.fromRGBO(253, 228, 0, 1),
                        Color.fromRGBO(253, 228, 0, 1),
                        Color.fromRGBO(237, 212, 3, 1),
                        Color.fromRGBO(237, 212, 3, 1),
                      ],
                      stops: [0.0, 0.5, 0.5, 1.0],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20 / 2),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(child: Text('1111')),
                          Container(child: Text('1111')),
                        ],
                      ),
                      Row(
            children: <Widget>[
              Icon(Icons.location_on, color: Colors.grey),
              Flexible(
                  child: Text('sfgdfhfghfghfg',
                 overflow: TextOverflow.ellipsis),
              )
            ],
          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Text('1111')),
                          Container(child: Expanded(child:Text('111111111111111111111111111111111111111111111111111111111111111',softWrap:true))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(child: Text('1111')),
                          Container(child: Text('1111')),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
              /* widget.icon != null
                              ? TitanIconShadow(
                                  Icon(
                                    widget.icon,
                                    color: Colors.black,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(width: 6),
                          Text('sfgrddffgdfgsdsfsaadsadasdasdasd11111111111111111111111111sad',
                                    softWrap: true,
                                    style: TextStyle(
                                      height: 1.20,
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 2.0,
                                          color: Colors.grey.shade800,
                                        ),
                                      ],
                                    ),
                                  ),*/
            ),
          ],
        ),
      ),
      onTapDown: widget.enabled ? _pressed : null,
      onTapUp: widget.enabled ? _unPressedOnTapUp : null,
      onTapCancel: widget.enabled ? _unPressed : null,
    );
  }

  
  void _pressed(_) {
    setState(() {
      _position = 0;
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _position = 6;
    });
    widget.onPressed();
  }
}

// Get a darker color from any entered color.
// Thanks to @NearHuscarl on StackOverflow
Color darken(Color color, ShadowDegree degree) {
  double amount = degree == ShadowDegree.dark ? 0.3 : 0.12;
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

enum ShadowDegree { light, dark }
