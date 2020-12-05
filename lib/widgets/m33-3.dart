import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';

class M33_3 extends StatefulWidget {
  @override
  _M33_3State createState() => _M33_3State();
}

class _M33_3State extends State<M33_3> {
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
    _phoneFocus = FocusNode();
    _phoneFocus.addListener(_focusNodeEvent);
    _familyFocus = FocusNode();
    _familyFocus.addListener(_focusNodeEvent);
    _nameFocus = FocusNode();
    _nameFocus.addListener(_focusNodeEvent);
    _companyFocus = FocusNode();
    _companyFocus.addListener(_focusNodeEvent);
    _positionFocus = FocusNode();
    _positionFocus.addListener(_focusNodeEvent);
    _emailFocus = FocusNode();
    _emailFocus.addListener(_focusNodeEvent);
  }

  _focusNodeEvent() {
    setState(() {});
  }

  BorderSide _borderSide = BorderSide(
    width: 1.0,
    color: Color.fromRGBO(0, 0, 0, 1),
  );

  @override
  Widget build(BuildContext context) {
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
                _groupRadio(),
                SizedBox(height: 30.0),
                TitanButton(
                  pressTap: () => pressSave(),
                  headButton: 'connect'.tr,
                  controlStyle: TitanControlStyle(),
                ),
                SizedBox(height: 15.0),
                TitanButton(
                    headButton: 'cancal'.tr,
                    controlStyle: TitanControlStyle(),
                    types: Types.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhone() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        PhoneInputFormatter(onCountrySelected: _onCountrySelected)
      ],
      focusNode: _phoneFocus,
      controller: _phoneText,
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _phoneFocus.hasFocus ? null : 'number_phone'.tr,
        labelText: _validate
            ? (_phoneFocus.hasFocus ? 'number_phone'.tr : null)
            : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red, fontSize: _phoneFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'number_phone'.tr + ' не введен';
        }
        if (!isPhoneValid(value)) {
          return 'Неправильно введен' + 'number_phone'.tr;
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

  Widget _buildFamily() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _familyFocus,
      controller: _familyText,
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _familyFocus.hasFocus ? null : 'family'.tr,
        labelText:
            _validate ? (_familyFocus.hasFocus ? 'family'.tr : null) : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red, fontSize: _familyFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'family'.tr + ' не введена';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введена ' + 'family'.tr;
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

  Widget _buildName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _nameFocus,
      controller: _nameText,
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _nameFocus.hasFocus ? null : 'name'.tr,
        labelText: _validate ? (_nameFocus.hasFocus ? 'name'.tr : null) : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red, fontSize: _nameFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'name'.tr + ' не введено';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введено ' + 'name'.tr;
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

  Widget _buildCompany() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _companyFocus,
      controller: _companyText,
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _companyFocus.hasFocus ? null : 'name_company'.tr,
        labelText: _validate
            ? (_companyFocus.hasFocus ? 'name_company'.tr : null)
            : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red, fontSize: _companyFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'name_company'.tr + ' не введено';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введено ' + 'name_company'.tr;
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

  Widget _buildPosition() {
    return TextFormField(
      keyboardType: TextInputType.name,
      focusNode: _positionFocus,
      controller: _positionText,
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _positionFocus.hasFocus ? null : 'position'.tr,
        labelText:
            _validate ? (_positionFocus.hasFocus ? 'position'.tr : null) : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red,
            fontSize: _positionFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'position'.tr + ' не введена';
        }
        if (!RegExp(r"(^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$)")
            .hasMatch(value)) {
          return 'Неправильно введена ' + 'position'.tr;
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

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocus,
      controller: _emailText,
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _emailFocus.hasFocus ? null : 'e_mail'.tr,
        labelText:
            _validate ? (_emailFocus.hasFocus ? 'e_mail'.tr : null) : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red, fontSize: _emailFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'e_mail'.tr + ' не введен';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Неправильно введен ' + 'e_mail'.tr;
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

  Widget _groupRadio() {
    return Column(
      children: [
        Text(
          'make_payments_business_account'.tr.toUpperCase(),
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
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
                child: Text('subscription_fee'.tr.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 1,toggleable:true ,
                  groupValue: selectedRadio,
                  activeColor: Colors.black,autofocus:true ,
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
                child: Text('response_team'.tr.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
      ],
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
