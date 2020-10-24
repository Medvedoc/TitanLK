import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/bloc/mainBloc.dart';
import 'package:flutter_image/theme/themeStyle.dart';

class MyWfrsloggedin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'WFRS',
              ),
            ),
            body: Container(
              constraints: BoxConstraints.expand(),
              child: ListView(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 10,
                ),
                children: [
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'wfrsCard',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'wfrsCardNumber',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '1234567890',
                          style: TextStyle(color: CompanyColors.blue),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 3.5),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Моя лига: ', //translate
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Высшая ', //translate
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 95),
                          child: Text(
                            'Повысить уровень лиги', //translate
                            style: Theme.of(context).textTheme.button,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 112),
                          child: Text(
                            'Мой рейтинг в лиге', //translate
                            style: Theme.of(context).textTheme.button,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Оплачено до: ', //translate
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              '31.10.2020(80 дней) ', //translate
                              style: TextStyle(color: CompanyColors.blue),
                            ),
                          ],
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 79),
                          child: Text(
                            'Оплатить следуйщий период', //translate
                            style: Theme.of(context).textTheme.button,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Мои билеты ', //translate
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          color: Theme.of(context).buttonColor,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '28.10.2020',
                                  style: TextStyle(color: CompanyColors.blue),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Название мероприятия длинное в две или даже три строки", //translate
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Theme.of(context).bottomAppBarColor,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: CompanyColors.blue,
                                        ),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          color: Theme.of(context).buttonColor,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '28.10.2020',
                                  style: TextStyle(color: CompanyColors.blue),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Название мероприятия длинное в две или даже три строки", //translate
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Theme.of(context).bottomAppBarColor,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: CompanyColors.blue,
                                        ),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 93),
                          child: Text(
                            'Календарь мероприятий', //translate
                            style: Theme.of(context).textTheme.button,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Мои заяки ', //translate
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          color: Theme.of(context).buttonColor,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '28.10.2020',
                                  style: TextStyle(color: CompanyColors.blue),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Название мероприятия длинное в две или даже три строки", //translate
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Theme.of(context).bottomAppBarColor,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: CompanyColors.blue,
                                        ),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          color: Theme.of(context).buttonColor,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '28.10.2020',
                                  style: TextStyle(color: CompanyColors.blue),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Название мероприятия длинное в две или даже три строки", //translate
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Theme.of(context).bottomAppBarColor,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: CompanyColors.blue,
                                        ),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 93),
                          child: Text(
                            'Календарь мероприятий', //translate
                            style: Theme.of(context).textTheme.button,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Хотите вступить в лигу WFRS? ',
                      
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 35,
                          ),
                          child: Text(
                            'Разнообразный и богатый опыт реализация намеченных плановых заданий требуют от нас анализа соответствующий условий активизации. Идейные соображения высшего порядка, а также консультация с широким активом требуют от нас анализа системы обучения кадров, соответствует насущным потребностям. Не следует, однако забывать, что новая модель организационной деятельности играет важную роль в формировании направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что новая модель организационной деятельности играет важную роль в формировании соответствующий условий активизации. Повседневная практика показывает, что рамки и место обучения кадров представляет собой интересный эксперимент проверки систем массового участия.',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 135),
                          child: Text(
                            'Оплатить',
                            style: Theme.of(context).textTheme.button,
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
