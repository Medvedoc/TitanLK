import 'dart:io';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanSwitch.dart';
import 'package:flutter_image/theme/themeStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart'
    show AndroidUiSettings, CropAspectRatio, ImageCompressFormat, ImageCropper;
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:list_tile_switch/list_tile_switch.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  String _phone;
  String _family;
  String _name;
  String _company;
  String _position;
  String _email;

  FocusNode _phoneFocus;
  FocusNode _familyFocus;
  FocusNode _nameFocus;
  FocusNode _companyFocus;
  FocusNode _positionFocus;
  FocusNode _emailFocus;

  bool isSwitched = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  @override
  void dispose() {
    super.dispose();
    _phoneFocus.dispose();
    _familyFocus.dispose();
    _nameFocus.dispose();
    _companyFocus.dispose();
    _positionFocus.dispose();
    _emailFocus.dispose();
  }

  @override
  void initState() {
    super.initState();
    _phoneFocus = new FocusNode();
    _phoneFocus.addListener(_focusNodeEvent);
    _familyFocus = new FocusNode();
    _familyFocus.addListener(_focusNodeEvent);
    _nameFocus = new FocusNode();
    _nameFocus.addListener(_focusNodeEvent);
    _companyFocus = new FocusNode();
    _companyFocus.addListener(_focusNodeEvent);
    _positionFocus = new FocusNode();
    _positionFocus.addListener(_focusNodeEvent);
    _emailFocus = new FocusNode();
    _emailFocus.addListener(_focusNodeEvent);
  }

  _focusNodeEvent() {
    setState(() {});
  }

  File _selectedFile;
  bool _inProcess = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildPhone() {
    return TextFormField(
      focusNode: _phoneFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      decoration: InputDecoration(
        labelText: "Номер телефона",
        labelStyle: TextStyle(
          height: _phoneFocus.hasFocus ? 1 : 3,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Номер телефона введен с ошибкой';
        }

        return null;
      },
      onSaved: (String value) {
        _phone = value;
      },
    );
  }

  Widget _buildFamily() {
    return TextFormField(
      focusNode: _familyFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      decoration: InputDecoration(
        labelText: "Фамилия",
        labelStyle: TextStyle(
          height: _familyFocus.hasFocus ? 1 : 3,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      //maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Фамилия введена с ошибкой';
        }

        return null;
      },
      onSaved: (String value) {
        _family = value;
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      focusNode: _nameFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      decoration: InputDecoration(
        labelText: "Имя",
        labelStyle: TextStyle(
          height: _nameFocus.hasFocus ? 1 : 3,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      //maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Имя введено с ошибкой';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildCompany() {
    return TextFormField(
      focusNode: _companyFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      decoration: InputDecoration(
        labelText: "Наименование организации",
        labelStyle: TextStyle(
          height: _companyFocus.hasFocus ? 1 : 3,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      //maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Наименование организации с ошибкой';
        }

        return null;
      },
      onSaved: (String value) {
        _company = value;
      },
    );
  }

  Widget _buildPosition() {
    return TextFormField(
      focusNode: _positionFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      decoration: InputDecoration(
        labelText: "Должность",
        labelStyle: TextStyle(
          height: _positionFocus.hasFocus ? 1 : 3,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      //maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Должность введена с ошибкой';
        }

        return null;
      },
      onSaved: (String value) {
        _position = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      focusNode: _emailFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
          height: _emailFocus.hasFocus ? 1 : 3,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email введен с ошибкой';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Email введен с ошибкой';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  /*Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }
*/

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Container(
        decoration: new BoxDecoration(
          border: new Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 1.0,
              style: BorderStyle.solid),
        ),
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Image.file(
          _selectedFile,
          //width: 640,
          //height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        decoration: new BoxDecoration(
          border: new Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 1.0,
              style: BorderStyle.solid),
        ),
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Image.asset(
          "assets/titan-placeholder.jpg",
          // width: 640,
          //height: 200,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 3),

        /*aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          //CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],*/
        compressQuality: 100,
        maxWidth: 640,
        maxHeight: 480,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Color.fromRGBO(233, 200, 45, 1.0),
          toolbarTitle: "Обрезать изображение",
          statusBarColor: Color.fromRGBO(0, 0, 0, 1.0),
          backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
        ),
        /*iosUiSettings: IOSUiSettings(
              toolbarColor: Colors.deepOrange,
              toolbarTitle: "RPS1 Cropper",
              statusBarColor: Colors.deepOrange.shade900,
              backgroundColor: Colors.white,
            )*/
      );

      this.setState(() {
        _selectedFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var titanButtonStandart = TitanButtonStyle();
    titanButtonStandart.colors[14] = Colors.black;
    titanButtonStandart.colors[15] = Colors.black;
    titanButtonStandart.textShadowx = 0;
    titanButtonStandart.textShadowy = 0;
    titanButtonStandart.intensity = 0;
    titanButtonStandart.showShadow = false;

    var titanButtonStandart2 = TitanButtonStyle();
    //titanButtonStandart2.colors[14] = Colors.black;
    titanButtonStandart2.colors[14] = Colors.black54;
    titanButtonStandart2.colors[15] = Colors.black45;
    titanButtonStandart2.textShadowx = -9;
    titanButtonStandart2.textShadowy = -9;
    titanButtonStandart2.intensity = 2;
    titanButtonStandart2.showShadow = true;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Настройка профиля'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.90,
                  ),
                ),
                SizedBox(height: 15.0),
                _buildPhone(),
                SizedBox(height: 15.0),
                _buildFamily(),
                SizedBox(height: 15.0),
                _buildName(),
                SizedBox(height: 15.0),
                _buildCompany(),
                SizedBox(height: 15.0),
                _buildPosition(),
                SizedBox(height: 15.0),
                _buildEmail(),
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border(
                      left: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1.0,
                      ),
                      top: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Показывать Пуш-уведомления',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            padding: const EdgeInsets.all(7.0),
                            decoration: new BoxDecoration(
                              border: new Border.all(
                                  color: Color.fromRGBO(101, 91, 0, 0.5),
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(254, 229, 0, 1),
                            ),
                            child: Icon(
                              FontAwesomeIcons.question,
                              color: Color.fromRGBO(101, 91, 0, 0.5),
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                      ListTileSwitch(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        switchActiveColor: Colors.black,
                        switchInactiveColor: Color.fromRGBO(101, 91, 0, 0.2),
                        circleActiveColor: Colors.white,
                        circleInactiveColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border(
                      left: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1.0,
                      ),
                      top: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Запрашивать Пин-код',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      ListTileSwitch(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        value: isSwitched2,
                        onChanged: (value) {
                          setState(() {
                            isSwitched2 = value;
                            print(isSwitched2);
                          });
                        },
                        switchActiveColor: Colors.black,
                        switchInactiveColor: Color.fromRGBO(101, 91, 0, 0.2),
                        circleActiveColor: Colors.white,
                        circleInactiveColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                TitanButton(
                  pressTap: () => pressSave(),
                  headButton: "Сохранить",
                  style: titanButtonStandart2,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50.0),
        Text(
          'Фотография'.toUpperCase(),
          style: TextStyle(
            fontSize: 18.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0.90,
          ),
        ),
        SizedBox(height: 15.0),
        getImageWidget(),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TitanButton(
                pressTap: () => getImage(ImageSource.camera),
                icon: Icons.camera_alt_outlined,
                headButton: "Фото",
                style: titanButtonStandart2,
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              flex: 1,
              child: TitanButton(
                pressTap: () => getImage(ImageSource.gallery),
                icon: Icons.image_outlined,
                headButton: "Галерея",
                style: titanButtonStandart2,
              ),
            ),
          ],
        ),
        (_inProcess)
            ? Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.95,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Center(),
        SizedBox(height: 30.0),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border(
              left: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
              right: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
              top: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
              bottom: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 1.0,
              ),
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Логирование (интерфейс ошибок)',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    padding: const EdgeInsets.all(7.0),
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Color.fromRGBO(101, 91, 0, 0.5),
                          width: 2.0,
                          style: BorderStyle.solid),
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(254, 229, 0, 1),
                    ),
                    child: Icon(
                      FontAwesomeIcons.question,
                      color: Color.fromRGBO(101, 91, 0, 0.5),
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              ListTileSwitch(
                contentPadding: EdgeInsets.only(left: 10.0),
                value: isSwitched3,
                onChanged: (value) {
                  setState(() {
                    isSwitched3 = value;
                    print(isSwitched3);
                  });
                },
                switchActiveColor: Colors.black,
                switchInactiveColor: Color.fromRGBO(101, 91, 0, 0.2),
                circleActiveColor: Colors.white,
                circleInactiveColor: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0),
      ],
    );
  }

  void pressTap() {
    getImage(ImageSource.camera);
  }

  void pressSave() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print(_phone);
    print(_family);
    print(_name);
    print(_company);
    print(_position);
    print(_email);
  }
}
