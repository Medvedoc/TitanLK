import 'package:flutter_image/elements/TitanBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/elements/TitanBoxStyle.dart';
import 'package:get/get.dart';

class TitanSettingsFull extends StatefulWidget {
  @override
  _TitanSettingsFullState createState() => _TitanSettingsFullState();
}

class _TitanSettingsFullState extends State<TitanSettingsFull> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'profile_setting'.tr, upperCase: true)),
        SizedBox(height: 10.0),
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'notices_setting'.tr, upperCase: true)),
        SizedBox(height: 10.0),
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'user_management'.tr, upperCase: true)),
        SizedBox(height: 10.0),
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'technical_support'.tr, upperCase: true)),
        SizedBox(height: 10.0),
        TitanBox(
            type: Type.button(),
            style: Decorations(
                background: ColorTheme.yellow, border: BorderTheme.button),
            title: TitleString(title: 'contacts'.tr, upperCase: true)),
      ],
    );
  }
}
