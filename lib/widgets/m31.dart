/*import 'package:flutter/material.dart';
import 'package:flutter_image/control/TitanCard/awesome_card.dart';

class M31 extends StatefulWidget {
  @override
  _M31State createState() => _M31State();
}

class _M31State extends State<M31> {
  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;

  FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CreditCard(
          width: MediaQuery.of(context).size.width,
          cardNumber: cardNumber,
          cardExpiry: expiryDate,
          cardHolderName: cardHolderName,
          cvv: cvv,
          //bankName: "Axis Bank",
          showBackSide: showBack,
          frontBackground: CardBackgrounds.black,
          backBackground: CardBackgrounds.white,
          showShadow: true,
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Card Number"),
                maxLength: 19,
                onChanged: (value) {
                  setState(() {
                    cardNumber = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Card Expiry"),
                maxLength: 5,
                onChanged: (value) {
                  setState(() {
                    expiryDate = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Card Holder Name"),
                onChanged: (value) {
                  setState(() {
                    cardHolderName = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: TextFormField(
                decoration: InputDecoration(hintText: "CVV"),
                maxLength: 3,
                onChanged: (value) {
                  setState(() {
                    cvv = value;
                  });
                },
                focusNode: _focusNode,
              ),
            ),
          ],
        )
      ],
    );
  }
}*/

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanCard/awesome_card.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';

class M31 extends StatefulWidget {
  @override
  _TitanSettingsProfileState createState() => _TitanSettingsProfileState();
}

class _TitanSettingsProfileState extends State<M31> {
  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;

  FocusNode _focusNode;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    _focusNode.dispose();
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
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CreditCard(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    cardNumber: cardNumber,
                    cardExpiry: expiryDate,
                    cardHolderName: cardHolderName,
                    cvv: cvv,
                    //bankName: "Axis Bank",
                    showBackSide: showBack,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /*Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Card Number"),
                          maxLength: 19,
                          onChanged: (value) {
                            setState(() {
                              cardNumber = value;
                            });
                          },
                        ),
                      ),*/
                      /*Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Card Expiry"),
                          maxLength: 5,
                          onChanged: (value) {
                            setState(() {
                              expiryDate = value;
                            });
                          },
                        ),
                      ),*/
                      /*Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          decoration:
                              InputDecoration(hintText: "Card Holder Name"),
                          onChanged: (value) {
                            setState(() {
                              cardHolderName = value;
                            });
                          },
                        ),
                      ),*/
                      /*Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "CVV"),
                          maxLength: 3,
                          onChanged: (value) {
                            setState(() {
                              cvv = value;
                            });
                          },
                          focusNode: _focusNode,
                        ),
                      ),*/
                    ],
                  ),
                  _buildNumberCard(),
                  SizedBox(height: 40.0),
                  _buildDate(),
                  SizedBox(height: 40.0),
                  _buildFamilyName(),
                  SizedBox(height: 40.0),
                  _buildCVV(),
                  SizedBox(height: 30.0),
                  TitanToogleAccordion(
                    background: Colors.grey.shade200,
                    border: Borderic.zero(),
                    textHeading: 'Привязать карту'.toUpperCase(),
                    types: Toogle.checkbox,
                  ),
                  SizedBox(height: 30.0),
                  TitanButton(
                    pressTap: () => pressSave(),
                    headButton: "Оплатить",
                    controlStyle: TitanControlStyle(),
                  ),
                  SizedBox(height: 20.0),
                  TitanButton(
                    headButton: "Отменить",
                    controlStyle: TitanControlStyle(),
                    types: Types.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberCard() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(19),
      ],
      onChanged: (value) {
        setState(() {
          cardNumber = value;
        });
      },
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
        hintText: _phoneFocus.hasFocus ? null : 'Номер карты',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText:
            _validate ? (_phoneFocus.hasFocus ? 'Номер карты' : null) : null,
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Номер карты не введен';
        }
        /*if (!RegExp(r"(^(?:[+0]9)?[0-9]{10,20}$)").hasMatch(value)) {
          return 'Неправильно введен номер телефона';
        }*/
        /*if (!isPhoneValid(value)) {
          return 'Неправильно введен номер телефона';
        }*/
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

  Widget _buildDate() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
      ],
      onChanged: (value) {
        setState(() {
          expiryDate = value;
        });
      },
      keyboardType: TextInputType.number,
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
        hintText: _familyFocus.hasFocus ? null : 'Срок действия',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText:
            _validate ? (_familyFocus.hasFocus ? 'Срок действия' : null) : null,
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
          return 'Срок действия не введен';
        }
        /*if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введена фамилия';
        }*/
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
  Widget _buildFamilyName() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(19),
      ],
      onChanged: (value) {
        setState(() {
          cardHolderName = value;
        });
      },
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
        hintText: _nameFocus.hasFocus ? null : 'Имя Фамилия владельца',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText: _validate
            ? (_nameFocus.hasFocus ? 'Имя Фамилия владельца' : null)
            : null,
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
          return 'Имя Фамилия владельца не введены';
        }
        /*if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введено имя';
        }*/
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
  Widget _buildCVV() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(3),
      ],
      onChanged: (value) {
        setState(() {
          cvv = value;
        });
      },
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
        hintText: _companyFocus.hasFocus ? null : 'CVC/CVV',
        hintStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(110, 110, 110, 1),
        ),
        labelText:
            _validate ? (_companyFocus.hasFocus ? 'CVC/CVV' : null) : null,
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
          return 'CVC/CVV не введен';
        }
        /*if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введено наименование организации';
        }*/
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

  void pressSave() {
    setState(() {
      _phoneText.text.isEmpty ? _validate = true : _validate = false;
      _familyText.text.isEmpty ? _validate = true : _validate = false;
      _nameText.text.isEmpty ? _validate = true : _validate = false;
      _companyText.text.isEmpty ? _validate = true : _validate = false;
    });

    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print(_phone);
    print(_family);
    print(_name);
    print(_company);
  }
}
