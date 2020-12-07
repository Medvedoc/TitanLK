import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:get/get.dart';

class TitanSettingsObjectNoGroup extends StatefulWidget {
  @override
  _TitanSettingsObjectNoGroupState createState() =>
      _TitanSettingsObjectNoGroupState();
}

class _TitanSettingsObjectNoGroupState
    extends State<TitanSettingsObjectNoGroup> {
  List<List<dynamic>> text = [
    ['full_arming'.tr, true],
    ['arming_section'.tr, true],
    ['removal_object_protection_sections'.tr, true],
    ['alarm'.tr, true],
    ['absence_220'.tr, false],
    ['recovery_220'.tr, false],
    ['battery_discharge'.tr, true],
    ['fire_alarm'.tr, true],
    ['removing_fire_alarm'.tr, true],
  ];
  List<dynamic> time = ['Пн-Вс', true, '15:20', '20:00'];
  List<dynamic> time2 = ['Пн-Вс', false, '17:20', '22:00'];
  List<List<dynamic>> timetable = [
    ['Пн', true, '15:21', '20:01'],
    ['Вт', true, '15:22', '20:02'],
    ['Ср', true, '15:23', '20:03'],
    ['Чт', true, '15:24', '20:04'],
    ['Пт', true, '15:25', '20:05'],
    ['Сб', true, '15:26', '20:06'],
    ['Вс', true, '15:27', '20:07'],
  ];
  List<List<dynamic>> timetable2 = [
    ['Пн', true, '17:21', '22:01'],
    ['Вт', true, '17:22', '22:02'],
    ['Ср', true, '17:23', '22:03'],
    ['Чт', true, '17:24', '22:04'],
    ['Пт', true, '17:25', '22:05'],
    ['Сб', true, '17:26', '22:06'],
    ['Вс', true, '17:27', '22:07'],
  ];

  callback(heightBlock) {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'objects_without_group'.tr.toUpperCase(),
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'basic_settings'.tr,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(height: 10.0),
        _basicsettings(),
        SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'additional_settings'.tr,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(height: 10.0),
        _additionalsettings(),
      ],
    );
  }

  Widget _basicsettings() {
    return TitanBox(
      callback: callback,
      type: Type.toogle(
          alignment: TypeAlignment.rightblock,
          toggleColor: Color.fromRGBO(233, 200, 45, 1)),
      style: Decorations(
          background:
              ColorTheme.coloris(color: Color.fromRGBO(233, 200, 45, 1)),
          border: BorderTheme.squareAll,
          textAlignment: MainAxisAlignment.start),
      title: TitleString(
          title: 'receive_notifications'.tr,
          textStyle: Theme.of(context).textTheme.headline4),
      dialog: DialogShow(title: 'message'),
      children: [_basicsettingsBuild()],
    );
  }

  Widget _basicsettingsBuild() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: text.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            TitanBox(
              callback: callback,
              type: Type.toogle(
                  alignment: TypeAlignment.rightblock,
                  toggleColor: Colors.white,
                  switched: text[index][1]),
              style: Decorations(
                  background: ColorTheme.coloris(color: Colors.white),
                  border: BorderTheme.zrbl,
                  textAlignment: MainAxisAlignment.start),
              title: TitleString(
                  title: text[index][0],
                  textStyle: Theme.of(context).textTheme.headline4),
            )
          ],
        );
      },
    );
  }

  Widget _additionalsettings() {
    return TitanBox(
        callback: callback,
        type: Type.toogle(
            alignment: TypeAlignment.rightblock,
            toggleColor: Color.fromRGBO(233, 200, 45, 1)),
        style: Decorations(
            background:
                ColorTheme.coloris(color: Color.fromRGBO(233, 200, 45, 1)),
            border: BorderTheme.squareAll,
            textAlignment: MainAxisAlignment.start),
        title: TitleString(
            title: 'schedule_alert_service'.tr,
            textStyle: Theme.of(context).textTheme.headline4),
        dialog: DialogShow(title: 'message'),
        children: [
          SizedBox(height: 10.0),
          _additionalsettingsRemoval(),
          SizedBox(height: 10.0),
          _additionalsettingsPutting(),
        ]);
  }

  Widget _additionalsettingsRemoval() {
    return TitanBox(
      callback: callback,
      type: Type.toogle(
          alignment: TypeAlignment.rightblock,
          toggleColor: Colors.white,
          switched: false),
      style: Decorations(
          background: ColorTheme.coloris(color: Colors.white),
          border: BorderTheme.squareAll,
          textAlignment: MainAxisAlignment.start),
      title: TitleString(
          title: 'removal_object_from_protection'.tr,
          textStyle: Theme.of(context).textTheme.headline4),
      children: [
        TitanBox(
          picker: PickerShow(time: [time[2], time[3]]),
          callback: callback,
          type: Type.checkbox(
              alignment: TypeAlignment.leftblock, switched: time[1]),
          style: Decorations(
              background: ColorTheme.coloris(color: Colors.grey.shade200),
              border: BorderTheme.zrbl,
              textAlignment: MainAxisAlignment.spaceBetween),
          title: TitleString(
              title: time[0],
              upperCase: true,
              textStyle: Theme.of(context).textTheme.headline3),
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: timetable.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TitanBox(
                          picker: PickerShow(
                              time: [timetable[index][2], timetable[index][3]]),
                          callback: callback,
                          type: Type.checkbox(
                              alignment: TypeAlignment.leftblock,
                              switched: timetable[index][1]),
                          style: Decorations(
                              background:
                                  ColorTheme.coloris(color: Colors.white),
                              border: BorderTheme.zrbl,
                              textAlignment: MainAxisAlignment.start),
                          title: TitleString(
                              title: timetable[index][0],
                              upperCase: true,
                              textStyle: Theme.of(context).textTheme.headline3))
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }

  Widget _additionalsettingsPutting() {
    return TitanBox(
      callback: callback,
      type: Type.toogle(
          alignment: TypeAlignment.rightblock,
          toggleColor: Colors.white,
          switched: false),
      style: Decorations(
          background: ColorTheme.coloris(color: Colors.white),
          border: BorderTheme.squareAll,
          textAlignment: MainAxisAlignment.start),
      title: TitleString(
          title: 'putting_object_under_protectio'.tr,
          textStyle: Theme.of(context).textTheme.headline4),
      children: [
        TitanBox(
          picker: PickerShow(time: [time2[2], time2[3]]),
          callback: callback,
          type: Type.checkbox(
              alignment: TypeAlignment.leftblock, switched: time2[1]),
          style: Decorations(
              background: ColorTheme.coloris(color: Colors.grey.shade200),
              border: BorderTheme.zrbl,
              textAlignment: MainAxisAlignment.start),
          title: TitleString(
              title: time2[0],
              upperCase: true,
              textStyle: Theme.of(context).textTheme.headline3),
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: timetable.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TitanBox(
                          picker: PickerShow(time: [
                            timetable2[index][2],
                            timetable2[index][3]
                          ]),
                          callback: callback,
                          type: Type.checkbox(
                              alignment: TypeAlignment.leftblock,
                              switched: timetable2[index][1]),
                          style: Decorations(
                              background:
                                  ColorTheme.coloris(color: Colors.white),
                              border: BorderTheme.zrbl,
                              textAlignment: MainAxisAlignment.start),
                          title: TitleString(
                              title: timetable2[index][0],
                              upperCase: true,
                              textStyle: Theme.of(context).textTheme.headline3))
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }
}
