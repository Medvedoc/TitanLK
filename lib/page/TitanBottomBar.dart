import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';
import 'package:flutter_image/control/TitanNavigationBar.dart';

Widget getNavigationBar(BuildContext context, MainState state) {
  switch (state.subState) {
    case MainState.m30:
      return null;
      break;
    default:
      return getButtonBarGeneral(context, state);
      break;
  }
}

Widget getButtonBarGeneral(BuildContext context, MainState state) {
  return TitanNavigationBar(
    currentIndex: getCurrentButton(state.subState),
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
          BlocProvider.of<MainBloc>(context)
              .add(MainPageEvent(MainState.objects));
          break;
        case 1:
          BlocProvider.of<MainBloc>(context)
              .add(MainPageEvent(MainState.stubPage1));
          break;
        case 2:
          BlocProvider.of<MainBloc>(context)
              .add(MainPageEvent(MainState.stubPage2));
          break;
        case 3:
          BlocProvider.of<MainBloc>(context)
              .add(MainPageEvent(MainState.stubPage3));
          break;
        case 4:
          BlocProvider.of<MainBloc>(context)
              .add(MainPageEvent(MainState.stubPage4));
          break;
      }
    },
  );
}

Widget getButtonBarSettings(BuildContext context, MainState state) {
  return TitanNavigationBar(
    currentIndex: getCurrentButtons(state.subState),
    items: [
      _getNavButtons(context, 'assets/titan-home.png', 'Объекты'),
    ],
    onTap: (value) {
      switch (value) {
        case 0:
          BlocProvider.of<MainBloc>(context)
              .add(MainPageEvent(MainState.objects));
          break;
      }
    },
  );
}






TitanNavigationBarItem _getNavButtons(
    BuildContext context, String icon, String text) {
  return TitanNavigationBarItem(icon: icon, title: text);
}


TitanNavigationBarItem _getNavButton(
    BuildContext context, String icon, String text) {
  return TitanNavigationBarItem(icon: icon, title: text);
}
getCurrentButton(int state) {
  switch (state) {
    case MainState.objects:
      return 0;
    case MainState.stubPage1:
      return 1;
    case MainState.stubPage2:
      return 2;
    case MainState.stubPage3:
      return 3;
    case MainState.stubPage4:
      return 4;
    case MainState.m1:
      return 0;
    case MainState.m2:
      return 0;
  }
  return 4;
}
getCurrentButtons(int state) {
  switch (state) {
    case MainState.objects:
      return 0;
  }
  //return 4;
}