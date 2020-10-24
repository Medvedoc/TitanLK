import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';

class ExtendedMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _iconSize = 25.0;
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
         /* _getButton(
              context,
              Icon(
                Icons.calendar_view_day,
                size: _iconSize,
                color: _color,
              ),
              "Календарь",
              MainState.objects),
          _getButton(context, Icon(Icons.score, size: _iconSize, color: _color),
              "Рейтинг команд", MainState.objects),
          _getButton(
              context,
              Icon(Icons.people, size: _iconSize, color: _color),
              "Члены WFRS",
              MainState.objects),
          _getButton(
              context,
              Icon(Icons.person, size: _iconSize, color: _color),
              "Мой WFRS",
              MainState.objects),
          _getButton(
              context,
              Icon(Icons.payment, size: _iconSize, color: _color),
              "Оплата",
              MainState.objects),
          _getButton(
              context,
              Icon(Icons.payment, size: _iconSize, color: _color),
              "Регистрация",
              MainState.welcomeWidget),*/
        ],
      )
    ]);

    /*
    GridView.count(
      primary: false,
      //padding: const EdgeInsets.all(10),
      crossAxisSpacing: 2,
      mainAxisSpacing: 1,
      crossAxisCount: 1,
      children: <Widget>[
        _getButton(
            context,
            Icon(Icons.new_releases, size: _iconSize, color: _color),
            "Объекты",
            MainState.objects),
        _getButton(
            context,
            Icon(
              Icons.calendar_view_day,
              size: _iconSize,
              color: _color,
            ),
            "Календарь",
            MainState.objects),
        _getButton(context, Icon(Icons.score, size: _iconSize, color: _color),
            "Рейтинг команд", MainState.objects),
        _getButton(context, Icon(Icons.people, size: _iconSize, color: _color),
            "Члены WFRS", MainState.objects),
        _getButton(context, Icon(Icons.person, size: _iconSize, color: _color),
            "Мой WFRS", MainState.objects),
        _getButton(context, Icon(Icons.payment, size: _iconSize, color: _color),
            "Оплата", MainState.objects),
        _getButton(context, Icon(Icons.payment, size: _iconSize, color: _color),
            "Регистрация", MainState.welcomeWidget),
      ],
    );*/
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
