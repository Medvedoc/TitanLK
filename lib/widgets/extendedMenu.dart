import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';

class ExtendedMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _iconSize = 20.0;
    var _color = Theme.of(context).textTheme.button.color;
    return Column(children: <Widget>[
      GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        children: <Widget>[
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "М1",
              MainState.m1),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "М2",
              MainState.m2),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "М3",
              MainState.m3),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "М3-1",
              MainState.m3_1),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "N2",
              MainState.n_2),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "user_manag",
              MainState.user_managment),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m11",
              MainState.m11),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m11_2",
              MainState.m11_2),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m11_3",
              MainState.m11_3),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "n_16",
              MainState.n_16),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m11_4",
              MainState.m11_4),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m11_5",
              MainState.m11_5),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m11_6",
              MainState.m11_6),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m11_4_2",
              MainState.m11_4_2),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m4-1",
              MainState.m4_1),
          _getButton(
              context,
              Icon(Icons.monitor, size: _iconSize, color: _color),
              "m30",
              MainState.m30)
        ],
      )
    ]);
  }

  Widget _getButton(BuildContext context, Icon icon, String text, int state) {
    return FlatButton(
      onPressed: () {
        BlocProvider.of<MainBloc>(context).add(MainPageEvent(state));
      },
      child: Column(children: [
        icon,
        Text(
          text,
          style: Theme.of(context).textTheme.button,
          maxLines: 2,
          softWrap: true,
          textAlign: TextAlign.center,
          textScaleFactor: 0.85,
        ),
      ]),
    );
  }
}
