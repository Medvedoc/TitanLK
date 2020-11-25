import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/bloc/mainBloc.dart';
import 'package:flutter_image/page/mainPage.dart';
import 'package:badges/badges.dart';

AppBar getAppBar(BuildContext context, MainState state) {
  switch (state.subState) {
    case MainState.objects:
      return getAppBarGeneral(context, state);
      break;
    case MainState.m30:
      return getAppBarSettings(context, state);
      break;
    case MainState.m30b:
      return getAppBarSettings(context, state);
      break;
    case MainState.m32:
      return getAppBarSettings(context, state);
      break;
    case MainState.m33:
      return getAppBarSettings(context, state);
      break;
    case MainState.m33_3:
      return getAppBarSettings(context, state);
      break;
    case MainState.m33_2:
      return getAppBarSettings(context, state);
      break;
    case MainState.m31:
      return getAppBarSettings(context, state);
      break;
    case MainState.m31 - 2:
      return getAppBarSettings(context, state);
      break;
    case MainState.m27:
      return null;
      break;
    case MainState.m27 - 2:
      return null;
      break;
    case MainState.stubPage1:
      return getAppBarGeneral(context, state);
      break;
    case MainState.stubPage2:
      return getAppBarGeneral(context, state);
      break;
    case MainState.stubPage3:
      return getAppBarGeneral(context, state);
      break;
    case MainState.stubPage4:
      return getAppBarGeneral(context, state);
      break;
    default:
      return getAppBarWidget(context, state);
      break;
  }
}

Widget getAppBarGeneral(BuildContext context, MainState state) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    titleSpacing: 10.0,
    elevation: 8,
    shadowColor: Colors.black,
    backgroundColor: Color.fromRGBO(233, 200, 45, 1.0),
    title: Text(state.getPageName(context)),
  );
}

Widget getAppBarWidget(BuildContext context, MainState state) {
  return AppBar(
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
      ),
    ),
    title: Text(state.getPageName(context)),
    actions: <Widget>[
      Badge(
        padding:EdgeInsets.all(5.0),
        badgeColor: Color.fromRGBO(254, 229, 0, 1),
        position: BadgePosition.topEnd(top: 5, end: -10),
        animationDuration: Duration(milliseconds: 50),
        animationType: BadgeAnimationType.scale,
        badgeContent: Text(
          15.toString(),
          style: TextStyle(color: Colors.black, fontSize: 14.0),
        ),
        child: Image.asset(
          'assets/titan-bell.png',
          height: 30.0,
        ),
      ),
      /*Center(
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
                    border: new Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        width: 1.0,
                        style: BorderStyle.solid),
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
      ),*/
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
  );
}

Widget getAppBarSettings(BuildContext context, MainState state) {
  return AppBar(
    centerTitle: false,
    titleSpacing: 10.0,
    elevation: 8,
    shadowColor: Colors.black,
    backgroundColor: Colors.white,
    leading: Transform.translate(
      offset: Offset(5, 0),
      child: IconButton(
        icon: Image.asset('assets/titan-icon-back.png'),
        iconSize: 26,
        alignment: Alignment.center,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
      ),
    ),
    title: Text(state.getPageName(context).toUpperCase(),
        style: Theme.of(context).textTheme.headline2),
  );
}
