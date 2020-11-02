import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';
import 'package:flutter_image/page/floating_navbar.dart';
import 'package:flutter_image/widgets/extendedMenu.dart';
import 'package:flutter_image/widgets/m11-2.dart';
import 'package:flutter_image/widgets/m11-3.dart';
import 'package:flutter_image/widgets/m11.dart';
import 'package:flutter_image/widgets/n_2.dart';
import 'package:flutter_image/widgets/settingsFull.dart';
import 'package:flutter_image/widgets/settingsNotifications.dart';
import 'package:flutter_image/widgets/settingsObjectNoGroup.dart';
import 'package:flutter_image/widgets/settingsProfile.dart';
import 'package:flutter_image/widgets/userManagment.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return BlocProvider(
        create: (context) => MainBloc(),
        child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 10.0,
              elevation: 8,
              shadowColor: Colors.black,
              backgroundColor: Color.fromRGBO(233, 200, 45, 1.0),
              leading: Transform.translate(
                offset: Offset(10, 0),
                child: IconButton(
                  icon: Image.asset('assets/titan-icon-back.png'),
                  iconSize: 26,
                  alignment: Alignment.center,
                  onPressed: () {},
                ),
              ),
              title: Text(state.getPageName(context)),
              actions: <Widget>[
                Center(
                  child: Container(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Image.asset(
                          'assets/titan-bell.png',
                          height: 30.0,
                        ),
                        Positioned(
                          right: -15.0,
                          top: -5.0,
                          child: Container(
                            height: 24,
                            width: 24,
                            constraints: BoxConstraints(
                              maxHeight: 45,
                              maxWidth: 45,
                            ),
                            decoration: BoxDecoration(
                              border: new Border.all(color: Color.fromRGBO(0, 0, 0, 0.3), width: 1.0, style: BorderStyle.solid),
                              color: Color.fromRGBO(254, 229, 0, 1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text("5"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                IconButton(
                  icon: Image.asset(
                    'assets/titan-menu.png',
                    height: 18.0,
                  ),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ],
            ),
            body: Stack(
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
                        new BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), offset: new Offset(0.0, 4.0), blurRadius: 4.0, spreadRadius: 2.0)
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                    child: _selectBody(context, state),
                    width: double.infinity,
                  ),
                ),
                //_selectBody(context, state),
                /*Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      new BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          offset: new Offset(0.0, 4.0),
                          blurRadius: 8.0,
                          spreadRadius: 8.0)
                    ],
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                  child: _selectBody(context, state),
                ),*/
              ],
            ),

            /*Container(
              height: MediaQuery.of(context).size.height,
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/titan-back.png'),
                      fit: BoxFit.cover)),
              child: Container(
                width: double.infinity,
                //height: double.infinity,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                  
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(4.0, 8.0),
                        blurRadius: 20.0,
                        spreadRadius: 4.0)
                  ],
                ),
                child: _selectBody(context, state),
              ),
            ),*/
            bottomNavigationBar: _getNavigationBar(context, state),
          );
        }),
      );
    });
  }

  Widget _selectBody(BuildContext context, MainState state) {
    switch (state.subState) {
      case MainState.objects:
        //return NewsWidget();
        //return SettingsWidget();
        return ExtendedMenuWidget();
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
      /*case MainState.myWFRS:
        return MyWfrsloggedin();
      case MainState.payment:
        return PaymentWidget();
      case MainState.settings:
        return ExtendedMenuWidget();
      case MainState.welcomeWidget:
        return WelcomeWidget();*/
      default:
        return ExtendedMenuWidget();
    }
  }

  Widget _getNavigationBar(BuildContext context, MainState state) {
    //return BottomNavigationBar(
    return FloatingNavbar(
      currentIndex: getCurrentButton(state.subState),
      //type: BottomNavigationBarType.fixed,
      items: [
        _getNavButton(context, 'assets/titan-home.png', 'Объекты'),
        _getNavButton(context, 'assets/titan-balance.png', 'Баланс'),
        _getNavButton(context, 'assets/titan-test.png', 'Тест'),
        _getNavButton(context, 'assets/titan-video.png', 'Видео'),
        _getNavButton(context, 'assets/titan-kts.png', 'КТС'),
      ],
      onTap: (value) {
        switch (value) {
          case 0:
            BlocProvider.of<MainBloc>(context).add(MainPageEvent(MainState.objects));
            break;
          /*case 1:
            BlocProvider.of<MainBloc>(context)
                .add(MainPageEvent(MainState.participants));
            break;
          case 2:
            BlocProvider.of<MainBloc>(context)
                .add(MainPageEvent(MainState.myWFRS));
            break;
          case 3:
            BlocProvider.of<MainBloc>(context)
                .add(MainPageEvent(MainState.payment));
            break;
          case 4:
            BlocProvider.of<MainBloc>(context)
                .add(MainPageEvent(MainState.settings));
            break;*/
        }
      },
    );
  }

  FloatingNavbarItem _getNavButton(BuildContext context, String icon, String text) {
    return FloatingNavbarItem(icon: icon, title: text);
  }

  getCurrentButton(int state) {
    return state > 5 ? 5 : state;
  }
}
