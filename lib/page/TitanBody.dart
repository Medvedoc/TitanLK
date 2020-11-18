import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/bloc/mainBloc.dart';
import 'package:flutter_image/stubPage/TitanStubPage1.dart';
import 'package:flutter_image/stubPage/TitanStubPage2.dart';
import 'package:flutter_image/stubPage/TitanStubPage3.dart';
import 'package:flutter_image/stubPage/TitanStubPage4.dart';
import 'package:flutter_image/widgets/extendedMenu.dart';
import 'package:flutter_image/widgets/m11-2.dart';
import 'package:flutter_image/widgets/m11-3.dart';
import 'package:flutter_image/widgets/m11-4-2.dart';
import 'package:flutter_image/widgets/m11-4.dart';
import 'package:flutter_image/widgets/m11-5.dart';
import 'package:flutter_image/widgets/m11-6.dart';
import 'package:flutter_image/widgets/m11.dart';
import 'package:flutter_image/widgets/m27.dart';
import 'package:flutter_image/widgets/m27_2.dart';
import 'package:flutter_image/widgets/m30.dart';
import 'package:flutter_image/widgets/m30b.dart';
import 'package:flutter_image/widgets/m31.dart';
import 'package:flutter_image/widgets/m31_2.dart';
import 'package:flutter_image/widgets/m32.dart';
import 'package:flutter_image/widgets/m33-2.dart';
import 'package:flutter_image/widgets/m33-3.dart';
import 'package:flutter_image/widgets/m33.dart';
import 'package:flutter_image/widgets/m4-1.dart';
import 'package:flutter_image/widgets/n_16.dart';
import 'package:flutter_image/widgets/n_2.dart';
import 'package:flutter_image/widgets/settingsFull.dart';
import 'package:flutter_image/widgets/settingsNotifications.dart';
import 'package:flutter_image/widgets/settingsObjectNoGroup.dart';
import 'package:flutter_image/widgets/settingsProfile.dart';
import 'package:flutter_image/widgets/userManagment.dart';

Widget getBody(BuildContext context, MainState state) {
  switch (state.subState) {
    case MainState.m27:
      return getBodyClean(context, state);
      break;
    default:
      return getBodyGeneral(context, state);
      break;
  }
}

Widget getBodyGeneral(BuildContext context, MainState state) {
  return Stack(
    fit: StackFit.loose,
    children: <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(),
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/titan-back.png'),
            ),
          ),
        ),
      ),
      SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              new BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  offset: new Offset(0.0, 4.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0)
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
          width: double.infinity,
          child: _selectBody(context, state),
        ),
      ),
    ],
  );
}
Widget getBodyClean(BuildContext context, MainState state) {
  return Stack(
    fit: StackFit.loose,
    children: <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(),
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/titan-back.png'),
            ),
          ),
        ),
      ),
      SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              new BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  offset: new Offset(0.0, 4.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0)
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
          width: double.infinity,
          child: _selectBody(context, state),
        ),
      ),
    ],
  );
}
Widget _selectBody(BuildContext context, MainState state) {
  switch (state.subState) {
    case MainState.objects:
      return ExtendedMenuWidget();
    case MainState.stubPage1:
      return TitanStubPage1();
    case MainState.stubPage2:
      return TitanStubPage2();
    case MainState.stubPage3:
      return TitanStubPage3();
    case MainState.stubPage4:
      return TitanStubPage4();
    case MainState.m1:
      return TitanSettingsFull();
    case MainState.m2:
      return TitanSettingsProfile();
    case MainState.m3:
      return TitanSettingsNotifications();
    case MainState.m3_1:
      return TitanSettingsObjectNoGroup();
    case MainState.n_2:
      return N2();
    case MainState.user_managment:
      return UserManagment();
    case MainState.m11:
      return M11();
    case MainState.m11_2:
      return M11_2();
    case MainState.m11_3:
      return M11_3();
    case MainState.n_16:
      return N16();
    case MainState.m11_4:
      return M11_4();
    case MainState.m11_5:
      return M11_5();
    case MainState.m11_6:
      return M11_6();
    case MainState.m11_4_2:
      return M11_4_2();
    case MainState.m4_1:
      return TitanChooseContract();
    case MainState.m30:
      return M30();
    case MainState.m30b:
      return M30b();
    case MainState.m33_2:
      return M33_2();
    case MainState.m33_3:
      return M33_3();
    case MainState.m33:
      return M33();
    case MainState.m32:
      return M32();
    case MainState.m31:
      return M31();
    case MainState.m31_2:
      return M31_2();
    case MainState.m27:
      return M27();
    case MainState.m27_2:
      return M27_2();
    default:
      return ExtendedMenuWidget();
  }
}

/*List<Widget> getActions(BuildContext context, MainState state) {
    return [
      Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
            IconButton(
                onPressed: () {}, //show filter dialog
                icon: Icon(Icons.search))
          ]))
    ];
  }*/
