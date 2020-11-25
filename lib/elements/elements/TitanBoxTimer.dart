import 'dart:async';

import 'package:flutter/material.dart';

const int aSec = 1;

// ignore: must_be_immutable
class TimerButton extends StatefulWidget {
  final int seconds;
  final TextStyle textStyle;
  bool timer;
  Function(bool) callbackTimer;

  TimerButton({
    @required this.seconds,
    this.textStyle,
    this.timer,
    this.callbackTimer,
  });

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  bool timeUpFlag = false;
  int timeCounter = 0;
  String get _timerText => timeCounter < 10 ? '0$timeCounter' : '$timeCounter';

  @override
  void initState() {
    super.initState();
    timeCounter = widget.seconds;
    _timerUpdate();
  }

  _timerUpdate() {
    Timer(const Duration(seconds: aSec), () async {
      setState(() {
        timeCounter--;
      });
      if (timeCounter != 0) {
        _timerUpdate();
      } else {
        timeUpFlag = true;
        widget.callbackTimer(timeUpFlag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Text(timeUpFlag ? _timerText : _timerText,
            textAlign: TextAlign.center,
            style: widget.textStyle != null
                ? widget.textStyle
                : Theme.of(context).textTheme.headline1.merge(
                      TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
      ),
    );
  }
}
