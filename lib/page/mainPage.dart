import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';
import 'package:flutter_image/page/TitanAppBar.dart';
import 'package:flutter_image/page/TitanBottomBar.dart';
import 'package:flutter_image/stubPage/TitanStubPage1.dart';
import 'package:flutter_image/stubPage/TitanStubPage2.dart';
import 'package:flutter_image/stubPage/TitanStubPage3.dart';
import 'package:flutter_image/stubPage/TitanStubPage4.dart';
import 'package:flutter_image/widgets/extendedMenu.dart';
import 'package:flutter_image/widgets/m11-2.dart';
import 'package:flutter_image/widgets/m11-3.dart';
import 'package:flutter_image/widgets/m11-4.dart';
import 'package:flutter_image/widgets/m11-5.dart';
import 'package:flutter_image/widgets/m11-6.dart';
import 'package:flutter_image/widgets/m11.dart';
import 'package:flutter_image/widgets/n_16.dart';
import 'package:flutter_image/widgets/n_2.dart';
import 'package:flutter_image/widgets/settingsFull.dart';
import 'package:flutter_image/widgets/settingsNotifications.dart';
import 'package:flutter_image/widgets/settingsObjectNoGroup.dart';
import 'package:flutter_image/widgets/settingsProfile.dart';
import 'package:flutter_image/widgets/userManagment.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        return DefaultTabController(
            initialIndex: 0,
            length: 5,
            child: Scaffold(
              appBar: getAppBar(context, state),
              body: getBody(context, state),
              bottomNavigationBar: getNavigationBar(context, state),
            ));
      }),
    );
  }

  Widget getBody(BuildContext context, MainState state) {
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
              boxShadow: [new BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), offset: new Offset(0.0, 4.0), blurRadius: 4.0, spreadRadius: 2.0)],
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            child: _selectBody(context, state),
            width: double.infinity,
          ),
        ),
      ],
    );
  }

  List<Widget> getActions(BuildContext context, MainState state) {
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
      default:
        return ExtendedMenuWidget();
    }
  }
}
