import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';

class ExtendedMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.zero, 

        children: <Widget>[
          _getButton(context, Icons.monitor, "M0", MainState.m0, true),
          _getButton(context, Icons.monitor, "М1", MainState.m1, false),
          _getButton(context, Icons.monitor, "М2", MainState.m2, false),
          _getButton(context, Icons.monitor, "М3", MainState.m3, false),
          _getButton(context, Icons.monitor, "М3-1", MainState.m3_1, false),
          _getButton(context, Icons.monitor, "N2", MainState.n_2, false),
          _getButton(context, Icons.monitor, "user_manag",
              MainState.user_managment, false),
          _getButton(context, Icons.monitor, "m11", MainState.m11, false),
          _getButton(context, Icons.monitor, "m11_2", MainState.m11_2, false),
          _getButton(context, Icons.monitor, "m11_3", MainState.m11_3, false),
          _getButton(context, Icons.monitor, "n_16", MainState.n_16, false),
          _getButton(context, Icons.monitor, "m11_4", MainState.m11_4, false),
          _getButton(context, Icons.monitor, "m11_5", MainState.m11_5, false),
          _getButton(context, Icons.monitor, "m11_6", MainState.m11_6, false),
          _getButton(
              context, Icons.monitor, "m11_4_2", MainState.m11_4_2, false),
          _getButton(context, Icons.monitor, "m4-1", MainState.m4_1, false),
          _getButton(context, Icons.monitor, "m27", MainState.m27, true),
          _getButton(context, Icons.monitor, "m27_2", MainState.m27_2, true),
          _getButton(context, Icons.monitor, "m30", MainState.m30, true),
          _getButton(context, Icons.monitor, "m30b", MainState.m30b, true),
          _getButton(context, Icons.monitor, "m31", MainState.m31, true),
          _getButton(context, Icons.monitor, "m31_2", MainState.m31_2, true),
          _getButton(context, Icons.monitor, "m32", MainState.m32, true),
          _getButton(context, Icons.monitor, "m33", MainState.m33, true),
          _getButton(context, Icons.monitor, "m33_2", MainState.m33_2, true),
          _getButton(context, Icons.monitor, "m33_3", MainState.m33_3, true),
        ],
      )
    ]);
  }

  Widget _getButton(BuildContext context, IconData icon, String text, int state,
      bool active) {
    return FlatButton(
      onPressed: () {
        BlocProvider.of<MainBloc>(context).add(MainPageEvent(state));
      },
      child: Container(
        width: 80.0,
        height: 60.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(icon,
              size: 20.0, color: active == true ? Colors.green : Colors.black),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.button.merge(TextStyle(
                  fontSize: 16.0,
                  color: active == true ? Colors.green : Colors.black)),
              maxLines: 1,
              //softWrap: true,
              textAlign: TextAlign.center,
              textScaleFactor: 0.85,
            ),
          ),
        ]),
      ),
    );
  }
}
