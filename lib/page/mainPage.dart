import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';
import 'package:flutter_image/page/TitanAppBar.dart';
import 'package:flutter_image/page/TitanBody.dart';
import 'package:flutter_image/page/TitanBottomBar.dart';

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
}
