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
  static const int settings = 1;
  //static const int participants = 1;
  //static const int myWFRS = 2;
  //static const int payment = 3;
  //static const int welcomeWidget = 5;
  String getPageName(BuildContext context) {
    switch (subState) {
      case objects:
        return 'Объекты';
      case settings:
        return 'Настройки';
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
