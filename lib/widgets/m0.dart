import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';

class M00 extends StatefulWidget {
  @override
  _M00State createState() => _M00State();
}

class _M00State extends State<M00> {
  callback(heightBlock) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10.0),
        TitanBox(
          onPressed: () {},
          type: Type.button(),
          style: Decorations(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            width:48,
            height: 48,
              background: ColorTheme.yellow, border: BorderTheme.button),
          icon: IconsTheme(icons: Icons.ac_unit, alignment: AlignmentBox.righttext),
        ),
        SizedBox(height: 10.0),
        TitanBox(
          onPressed: () {},
          callback: callback,
          type: Type.button(),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.trbz,
              textAlignment: MainAxisAlignment.start),
          title: TitleString(title: 'Кнопка', upperCase: true),
          dialog: DialogShow(title: 'sfgdfgfdgfdgfd'),
          icon: IconsTheme(icons: Icons.ac_unit),
          children: [
            SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: 15,
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
          onPressed: () {},
          callback: callback,
          type: Type.button(alignment: TypeAlignment.rightblock),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.button,
              textAlignment: MainAxisAlignment.end),
          title: TitleString(title: 'Кнопка', upperCase: true),
          children: [
            SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: 35,
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
          switched: true,
          onPressed: () {},
          callback: callback,
          type: Type.toogle(),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.all,
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
          picker: PickerShow(time: ['15:00', '23:00']),
          onPressed: () {},
          callback: callback,
          type:
              Type.checkbox(alignment: TypeAlignment.rightblock, switched: true),
          style: Decorations(
              background: ColorTheme.yellow,
              border: BorderTheme.all,
              textAlignment: MainAxisAlignment.end),
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
              picker: PickerShow(time: ['15:00', '23:00']),
              onPressed: () {},
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
              onPressed: () {},
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
          onPressed: () {},
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
        SizedBox(height: 30.0),
      ],
    );
  }
}
