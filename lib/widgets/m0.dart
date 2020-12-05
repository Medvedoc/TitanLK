import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';

class M00 extends StatefulWidget {
  @override
  _M00State createState() => _M00State();
}

class _M00State extends State<M00> {
  int groupValue_1 = 1;
  callback(heightBlock) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitanBox(
            onTap: (value, fromTime, toTime) {
              print(value);
            },
            callback: callback,
            type: Type.button(alignment: TypeAlignment.leftblock),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'Кнопка', upperCase: true),
            icon: IconsTheme(
                icons: Icons.ac_unit, alignment: AlignmentBox.lefttext)),
        SizedBox(height: 10.0),
        TitanBox(
          onTap: (value, fromTime, toTime) {
            print(value);
          },
          callback: callback,
          type:
              Type.button(alignment: TypeAlignment.rightblock, switched: true),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.button,
              textAlignment: MainAxisAlignment.end),
          title: TitleString(title: 'Кнопка', upperCase: true),
          icon: IconsTheme(icons: Icons.ac_unit),
          children: [
            SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text('строка №$index'),
                    ],
                  );
                }),
          ],
        ),
        SizedBox(height: 10.0),
        TitanBox(
          callback: callback,
          type: Type.button(alignment: TypeAlignment.rightblock),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.button,
              textAlignment: MainAxisAlignment.start),
          title: TitleString(title: 'Кнопка', upperCase: true),
          icon: IconsTheme(
              icons: Icons.ac_unit, alignment: AlignmentBox.lefttext),
          children: [
            SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text('строка №$index'),
                    ],
                  );
                }),
          ],
        ),
        SizedBox(height: 10.0),
        TitanBox(
          onTap: (value, fromTime, toTime) {
            print(value);
          },
          switched: true,
          callback: callback,
          type: Type.toogle(alignment: TypeAlignment.leftblock),
          style: Decorations(
            background: ColorTheme.yellow,
            border: BorderTheme.container,
          ),
          title: TitleString(title: 'Переключатель включен', upperCase: true),
        ),
        SizedBox(height: 10.0),
        TitanBox(
          switched: true,
          callback: callback,
          type: Type.toogle(alignment: TypeAlignment.rightblock),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.container,
              textAlignment: MainAxisAlignment.end),
          title: TitleString(title: 'Переключатель включен', upperCase: true),
          children: [
            SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text('строка №$index'),
                    ],
                  );
                }),
          ],
        ),
        SizedBox(height: 10.0),
        TitanBox(
          onTap: (value, fromTime, toTime) {
            print(value);
          },
          picker: PickerShow(time: ['15:00', '23:00']),
          callback: callback,
          type: Type.checkbox(
              alignment: TypeAlignment.rightblock, switched: true),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.all,
              textAlignment: MainAxisAlignment.start),
          title: TitleString(title: 'Пн-Вс', upperCase: true),
        ),
        SizedBox(height: 10.0),
        TitanBox(
          onTap: (value, fromTime, toTime) {
            print('$value $fromTime $toTime');
          },
          picker: PickerShow(time: ['15:00', '23:00']),
          callback: callback,
          type:
              Type.checkbox(alignment: TypeAlignment.leftblock, switched: true),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.all,
              textAlignment: MainAxisAlignment.start),
          title: TitleString(title: 'Пн-Вс', upperCase: true),
          children: [
            /*SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text('строка №$index'),
                    ],
                  );
                }),*/
            TitanBox(
              onTap: (value, fromTime, toTime) {
                print('$value $fromTime $toTime');
              },
              picker: PickerShow(time: ['15:00', '23:00']),
              callback: callback,
              type: Type.checkbox(alignment: TypeAlignment.leftblock),
              style: Decorations(
                  background: ColorTheme.yellow,
                  border: BorderTheme.all,
                  textAlignment: MainAxisAlignment.start),
              title: TitleString(title: 'Пн-Вс', upperCase: true),
            ),
            SizedBox(height: 10.0),
            TitanBox(
              picker: PickerShow(time: ['15:00', '23:00']),
              callback: callback,
              type: Type.checkbox(
                  alignment: TypeAlignment.leftblock, switched: true),
              style: Decorations(
                  background: ColorTheme.yellow,
                  border: BorderTheme.all,
                  textAlignment: MainAxisAlignment.start),
              title: TitleString(title: 'Пн-Вс', upperCase: true),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        TitanBox(
          callback: callback,
          type: Type.indicator(alignment: TypeAlignment.rightblock),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.all,
              textAlignment: MainAxisAlignment.end),
          title: TitleString(title: 'Отменить', upperCase: true),
          children: [
            SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text('строка №$index'),
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_image/control/multic.dart';

class M00 extends StatelessWidget {
  const M00({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'Horizontal',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shape Disabled',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRadioButton(
                        horizontal: true,
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: [
                          'Student',
                          'Parent',
                          'Teacher',
                          'hgfh',
                          'jhgiugx'
                        ],
                        buttonValues: [
                          "STUDENT",
                          "PARENT",
                          "TEACHER",
                          'hgfh',
                          'jhgiugx'
                        ],
                        defaultSelected: "STUDENT",
                        radioButtonValue: (value) {
                          print(value);
                        },
                        selectedColor: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shape Enabled',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRadioButton(
                        horizontal: true,
                        enableShape: true,
                        elevation: 0,
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: [
                          'Student',
                          'Parent',
                          'Teacher',
                        ],
                        buttonValues: [
                          1,
                          2,
                          3,
                        ],
                        defaultSelected: 1,
                        radioButtonValue: (value) {
                          print(value);
                        },
                        selectedColor: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Verticle',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shape Disabled',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRadioButton(
                      elevation: 0,
                      absoluteZeroSpacing: true,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: [
                        'Student',
                        'Parent',
                        'Teacher',
                      ],
                      buttonValues: [
                        "STUDENT",
                        "PARENT",
                        "TEACHER",
                      ],
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                        print(value);
                      },
                      selectedColor: Theme.of(context).accentColor,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shape Enabled',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRadioButton(
                      enableShape: true,
                      elevation: 0,
                      defaultSelected: "Sunday",
                      enableButtonWrap: true,
                      width: 120,
                      autoWidth: false,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: [
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                        "Friday",
                        "Saturday",
                        "Sunday",
                      ],
                      buttonValues: [
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                        "Friday",
                        "Saturday",
                        "Sunday",
                      ],
                      radioButtonValue: (value) {
                        print(value);
                      },
                      selectedColor: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
    );
  }
}*/
