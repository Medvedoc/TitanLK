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
  static const int m1 = 1;
  static const int m2 = 2;
  static const int m3 = 3;
  static const int m3_1 = 4;
  static const int n_2 = 5;
  static const int user_managment = 6;
  static const int m11 = 7;
  static const int m11_2 = 8;
  static const int m11_3 = 9;

  //static const int participants = 1;
  //static const int myWFRS = 2;
  //static const int payment = 3;
  //static const int welcomeWidget = 5;
  String getPageName(BuildContext context) {
    switch (subState) {
      case objects:
        return 'Объекты';
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
