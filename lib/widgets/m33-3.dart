import 'dart:io';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/theme/themeStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class M33_1 extends StatefulWidget {
  @override
  _TitanSettingsProfileState createState() => _TitanSettingsProfileState();
}

class _TitanSettingsProfileState extends State<M33_1> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneCountryData countryData;
  TextEditingController _phoneController = TextEditingController();
  void _onCountrySelected(PhoneCountryData countryData) {
    setState(() {
      countryData = countryData;
    });
  }

  int selectedRadio;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
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
    selectedRadio = 0;
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

  //String _picked = "Two";

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
                /*TitanToogleAccordion(
                  types: Toogle.radio,
                  picked: 'Two1',
                  labels: ['One1', 'Two1'],
                  childok: [
                    Text('text1'),
                    Text('text2')
                  ],
                  border: Borderic.zero(),
                ),*/
                SizedBox(height: 20.0),
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
                Text(
                  'ПРОИЗВОДИТЬ ОПЛАТУ'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.90,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'ЗА СЧЕТ БИЗНЕС-АККАУНТА'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.90,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  color: Colors.grey.shade200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "АБОНЕНТСКАЯ ПЛАТА",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Radio(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: 1,
                          groupValue: selectedRadio,
                          activeColor: Colors.black,
                          onChanged: (val) {
                            print("Radio $val");
                            setSelectedRadio(val);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  color: Colors.grey.shade200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ГРУППА РЕАГИРОВАНИЯ (ГБР)",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Radio(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: 2,
                          groupValue: selectedRadio,
                          activeColor: Colors.black,
                          onChanged: (val) {
                            print("Radio $val");
                            setSelectedRadio(val);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                TitanButton(
                  pressTap: () => pressSave(),
                  headButton: "Сохранить",
                  controlStyle: TitanControlStyle(),
                ),
                SizedBox(height: 15.0),
                TitanButton(
                  headButton: "Отменить",
                  controlStyle: TitanControlStyle(),
                  types: Types.grey
                ),
              ],
            ),
          ),
        ),
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
