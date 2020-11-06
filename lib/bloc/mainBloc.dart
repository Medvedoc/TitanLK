import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MainEvent {}

class MainPageEvent extends MainEvent {
  int tabIndex;
  MainPageEvent(this.tabIndex) : super();
}

class MainState {
  int subState = 0;
  static const int objects = 0;
  static const int stubPage1 = 1;
  static const int stubPage2 = 2;
  static const int stubPage3 = 3;
  static const int stubPage4 = 4;
  static const int m1 = 5;
  static const int m2 = 6;
  static const int m3 = 7;
  static const int m3_1 = 8;
  static const int n_2 = 9;
  static const int user_managment = 10;
  static const int m11 = 11;
  static const int m11_2 = 12;
  static const int m11_3 = 13;
  static const int n_16 = 14;
  static const int m11_4 = 15;
  static const int m11_5 = 16;
  static const int m11_6 = 17;

  //static const int participants = 1;
  //static const int myWFRS = 2;
  //static const int payment = 3;
  //static const int welcomeWidget = 5;
  String getPageName(BuildContext context) {
    switch (subState) {
      case objects:
        return 'Объекты';
      case stubPage1:
        return 'Страницы не существует';
      case stubPage2:
        return 'Страницы не существует';
      case stubPage3:
        return 'Страницы не существует';
      case stubPage4:
        return 'Страницы не существует';
      case m1:
        return 'Настройки';
      case m2:
        return 'Настройки';
      case m3:
        return 'Настройки';
      case m3_1:
        return 'Настройка уведомлений';
      case n_2:
        return 'Настройка уведомлений';
      case user_managment:
        return 'Настройка уведомлений';
      case m11:
        return 'Настройка уведомлений';
      case m11_2:
        return 'Настройка уведомлений';
      case m11_3:
        return 'Настройка уведомлений';
      case n_16:
        return 'Настройка уведомлений';
      case m11_4:
        return 'Настройка уведомлений';
      case m11_5:
        return 'Настройка уведомлений';
      case m11_6:
        return 'Настройка уведомлений';
      //case participants:
      //  return 'wfrsParticipants';
      //case myWFRS:
      //  return 'WFRS';
      //case payment:
      //  return 'Payment';

    }
    return "";
  }
}

class MainState2 extends MainState {}

class MainBloc extends Bloc<MainPageEvent, MainState> {
  @override
  MainState get initialState => pageState;
  static MainState pageState = MainState();
  @override
  Stream<MainState> mapEventToState(MainPageEvent event) async* {
    if (event is MainPageEvent) {
      var state = MainState();
      state.subState = event.tabIndex;
      yield state;
    }
  }
}
