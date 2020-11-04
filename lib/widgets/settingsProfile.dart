import 'dart:io';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart'
    show AndroidUiSettings, CropAspectRatio, ImageCompressFormat, ImageCropper;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class TitanSettingsProfile extends StatefulWidget {
  @override
  _TitanSettingsProfileState createState() => _TitanSettingsProfileState();
}

class _TitanSettingsProfileState extends State<TitanSettingsProfile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneCountryData _countryData;
  TextEditingController _phoneController = TextEditingController();

  /// this callback is called in PhoneInputFormatter when
  /// a country is detected by a phone code
  void _onCountrySelected(PhoneCountryData countryData) {
    setState(() {
      _countryData = countryData;
    });
  }

  final _phoneText = TextEditingController();
  final _familyText = TextEditingController();
  final _nameText = TextEditingController();
  final _companyText = TextEditingController();
  final _positionText = TextEditingController();
  final _emailText = TextEditingController();

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
  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    _phoneFocus.dispose();
    _familyFocus.dispose();
    _nameFocus.dispose();
    _companyFocus.dispose();
    _positionFocus.dispose();
    _emailFocus.dispose();
    _phoneText.dispose();
    _familyText.dispose();
    _nameText.dispose();
    _companyText.dispose();
    _positionText.dispose();
    _emailText.dispose();

    _phoneController?.dispose();
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
                SizedBox(height: 40.0),
                _buildPhone(),
                SizedBox(height: 40.0),
                _buildFamily(),
                SizedBox(height: 40.0),
                _buildName(),
                SizedBox(height: 40.0),
                _buildCompany(),
                SizedBox(height: 40.0),
                _buildPosition(),
                SizedBox(height: 40.0),
                _buildEmail(),
                SizedBox(height: 30.0),
                _pushToogle(),
                _pinToogle(),
                SizedBox(height: 30.0),
                TitanButton(
                  pressTap: () => pressSave(),
                  headButton: "Сохранить",
                  controlStyle: TitanControlStyle(),
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
                        controlStyle: TitanControlStyle(),
                        type: 'yellow',
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      flex: 1,
                      child: TitanButton(
                        pressTap: () => getImage(ImageSource.gallery),
                        icon: Icons.image_outlined,
                        headButton: "Галерея",
                        controlStyle: TitanControlStyle(),
                        type: 'yellow',
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
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
        _logToogle(),
        SizedBox(height: 15.0),
      ],
    );
  }

  //Поле ввода номера телефона
  Widget _buildPhone() {
    return TextFormField(
      keyboardType: TextInputType.number,
      focusNode: _phoneFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      controller: _phoneText,
      decoration: InputDecoration(
        isDense: true,
        hintText: _phoneFocus.hasFocus ? null : 'Номер телефона',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText:
            _validate ? (_phoneFocus.hasFocus ? 'Номер телефона' : null) : null,
        labelStyle: TextStyle(
          color: Colors.red,
          fontSize: _phoneFocus.hasFocus ? 18.0 : 13.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      inputFormatters: [
        PhoneInputFormatter(onCountrySelected: _onCountrySelected)
      ],
      validator: (value) {
        if (value.isEmpty) {
          return 'Номер телефона не введен';
        }
        /*if (!RegExp(r"(^(?:[+0]9)?[0-9]{10,20}$)").hasMatch(value)) {
          return 'Неправильно введен номер телефона';
        }*/
        if (!isPhoneValid(value)) {
          return 'Неправильно введен номер телефона';
        }
        return null;
      },
      onTap: () {
        _phoneText.text = "";
      },
      onSaved: (String value) {
        _phone = value;
      },
    );
  }

  //Поле ввода Фамилия
  Widget _buildFamily() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _familyFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      controller: _familyText,
      decoration: InputDecoration(
        isDense: true,
        hintText: _familyFocus.hasFocus ? null : 'Фамилия',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText:
            _validate ? (_familyFocus.hasFocus ? 'Фамилия' : null) : null,
        labelStyle: TextStyle(
          color: Colors.red,
          fontSize: _familyFocus.hasFocus ? 18.0 : 13.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Фамилия не введена';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введена фамилия';
        }
        return null;
      },
      onTap: () {
        _familyText.text = "";
      },
      onSaved: (String value) {
        _family = value;
      },
    );
  }

  //Поле ввода имени
  Widget _buildName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _nameFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      controller: _nameText,
      decoration: InputDecoration(
        isDense: true,
        hintText: _nameFocus.hasFocus ? null : 'Имя',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText: _validate ? (_nameFocus.hasFocus ? 'Имя' : null) : null,
        labelStyle: TextStyle(
          color: Colors.red,
          fontSize: _nameFocus.hasFocus ? 18.0 : 13.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Имя не введено';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введено имя';
        }
        return null;
      },
      onTap: () {
        _nameText.text = "";
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  //Поле ввода имени
  Widget _buildCompany() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _companyFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      controller: _companyText,
      decoration: InputDecoration(
        isDense: true,
        hintText: _companyFocus.hasFocus ? null : 'Наименование организации',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText: _validate
            ? (_companyFocus.hasFocus ? 'Наименование организации' : null)
            : null,
        labelStyle: TextStyle(
          color: Colors.red,
          fontSize: _companyFocus.hasFocus ? 18.0 : 13.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Наименование организации не введено';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введено наименование организации';
        }
        return null;
      },
      onTap: () {
        _companyText.text = "";
      },
      onSaved: (String value) {
        _company = value;
      },
    );
  }

  //Поле ввода должности
  Widget _buildPosition() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _positionFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      controller: _positionText,
      decoration: InputDecoration(
        isDense: true,
        hintText: _positionFocus.hasFocus ? null : 'Должность',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText:
            _validate ? (_positionFocus.hasFocus ? 'Должность' : null) : null,
        labelStyle: TextStyle(
          color: Colors.red,
          fontSize: _positionFocus.hasFocus ? 18.0 : 13.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Должность не введена';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введена должность';
        }
        return null;
      },
      onTap: () {
        _positionText.text = "";
      },
      onSaved: (String value) {
        _position = value;
      },
    );
  }

  //Поле ввода почты
  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocus,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(33, 32, 30, 1),
      ),
      controller: _emailText,
      decoration: InputDecoration(
        isDense: true,
        hintText: _emailFocus.hasFocus ? null : 'E-mail',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText: _validate ? (_emailFocus.hasFocus ? 'E-mail' : null) : null,
        labelStyle: TextStyle(
          color: Colors.red,
          fontSize: _emailFocus.hasFocus ? 18.0 : 13.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Email не введен';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Неправильно введен Email';
        }
        return null;
      },
      onTap: () {
        _emailText.text = "";
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

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

  Widget _pushToogle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  padding: const EdgeInsets.all(5.0),
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 16.0),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                      "TextTextTextTextTextTextTextTextTextTextTextTextText")),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: FlutterSwitch(
              value: isSwitched,
              onToggle: (val) {
                setState(() {
                  isSwitched = val;
                  print(isSwitched);
                });
              },
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              toggleColor: Colors.white,
              width: 40.0,
              height: 20.0,
              toggleSize: 18.0,
              valueFontSize: 16.0,
              borderRadius: 20.0,
              padding: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pinToogle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
          Container(
            alignment: Alignment.centerRight,
            child: FlutterSwitch(
              value: isSwitched2,
              onToggle: (val) {
                setState(() {
                  isSwitched2 = val;
                  print(isSwitched2);
                });
              },
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              toggleColor: Colors.white,
              width: 40.0,
              height: 20.0,
              toggleSize: 18.0,
              valueFontSize: 16.0,
              borderRadius: 20.0,
              padding: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _logToogle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  padding: const EdgeInsets.all(5.0),
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 16.0),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                      "TextTextTextTextTextTextTextTextTextTextTextTextText")),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: FlutterSwitch(
              value: isSwitched3,
              onToggle: (val) {
                setState(() {
                  isSwitched3 = val;
                  print(isSwitched3);
                });
              },
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              toggleColor: Colors.white,
              width: 40.0,
              height: 20.0,
              toggleSize: 18.0,
              valueFontSize: 16.0,
              borderRadius: 20.0,
              padding: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  void pressTap() {
    getImage(ImageSource.camera);
  }

  void pressSave() {
    setState(() {
      _phoneText.text.isEmpty ? _validate = true : _validate = false;
      _familyText.text.isEmpty ? _validate = true : _validate = false;
      _nameText.text.isEmpty ? _validate = true : _validate = false;
      _companyText.text.isEmpty ? _validate = true : _validate = false;
      _positionText.text.isEmpty ? _validate = true : _validate = false;
      _emailText.text.isEmpty ? _validate = true : _validate = false;
    });

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
