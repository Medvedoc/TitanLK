import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image/control/TitanButton.dart';
import 'package:flutter_image/control/TitanCard/awesome_card.dart';
import 'package:flutter_image/control/TitanControlStyle.dart';
import 'package:flutter_image/control/TitanToogleAccordion.dart';
import 'package:get/get.dart';

class M31 extends StatefulWidget {
  @override
  _TitanSettingsProfileState createState() => _TitanSettingsProfileState();
}

class _TitanSettingsProfileState extends State<M31> {
  double _heightCard = 200.0;
  String _cardNumber = "";
  String _cardHolderName = "";
  String _expiryDate = "";
  String _cvv = "";
  bool showBack = false;
  BorderSide _borderSide =
      BorderSide(width: 1.0, color: Color.fromRGBO(0, 0, 0, 1));

  FocusNode _focusNode;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _creditCardText = TextEditingController();
  final _expirationDateText = TextEditingController();
  final _firstLastNameText = TextEditingController();
  final _cvvText = TextEditingController();

  String _creditCards;
  String _expirationDate;
  String _firstLastName;
  String _cvvCVC;

  FocusNode _creditCardFocus;
  FocusNode _expirationDateFocus;
  FocusNode _firstLastNameFocus;
  FocusNode _cvvFocus;
  bool _validate = false;

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
                  _creditCard(),
                  SizedBox(height: 40),
                  _buildCardNumber(),
                  SizedBox(height: 40.0),
                  _buildExpirationDate(),
                  SizedBox(height: 40.0),
                  _buildFirstLastName(),
                  SizedBox(height: 40.0),
                  _buildCVV(),
                  SizedBox(height: 30.0),
                  TitanToogleAccordion(
                    background: Colors.grey.shade200,
                    border: Borderic.zero(),
                    textHeading: 'card_link'.tr.toUpperCase(),
                    types: Toogle.checkbox,
                  ),
                  SizedBox(height: 30.0),
                  TitanButton(
                    pressTap: () => pressSave(),
                    headButton: 'pay'.tr,
                    controlStyle: TitanControlStyle(),
                  ),
                  SizedBox(height: 20.0),
                  TitanButton(
                    headButton: 'cancal'.tr,
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

  Widget _creditCard() {
    return CreditCard(
      width: MediaQuery.of(context).size.width,
      height: _heightCard,
      cardNumber: _cardNumber,
      cardExpiry: _expiryDate,
      cardHolderName: _cardHolderName,
      cvv: _cvv,
      showBackSide: showBack,
      frontBackground: CardBackgrounds.black,
      backBackground: CardBackgrounds.white,
      showShadow: true,
    );
  }

  Widget _buildCardNumber() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(19)],
      keyboardType: TextInputType.number,
      focusNode: _creditCardFocus,
      controller: _creditCardText,
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _creditCardFocus.hasFocus ? null : 'card_number'.tr,
        labelText: _validate
            ? (_creditCardFocus.hasFocus ? 'card_number'.tr : null)
            : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red,
            fontSize: _creditCardFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      onChanged: (value) {
        setState(() {
          _cardNumber = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'card_number'.tr + ' не введен';
        }
        return null;
      },
      onTap: () {
        _creditCardText.text = "";
      },
      onSaved: (String value) {
        _creditCards = value;
      },
    );
  }

  Widget _buildExpirationDate() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(4)],
      keyboardType: TextInputType.number,
      focusNode: _expirationDateFocus,
      controller: _expirationDateText,
      onChanged: (value) {
        setState(() {
          _expiryDate = value;
        });
      },
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _expirationDateFocus.hasFocus ? null : 'expiration_date'.tr,
        labelText: _validate
            ? (_expirationDateFocus.hasFocus ? 'expiration_date'.tr : null)
            : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red,
            fontSize: _expirationDateFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'expiration_date'.tr + 'не введен';
        }
        return null;
      },
      onTap: () {
        _expirationDateText.text = "";
      },
      onSaved: (String value) {
        _expirationDate = value;
      },
    );
  }

  Widget _buildFirstLastName() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(19)],
      keyboardType: TextInputType.name,
      focusNode: _firstLastNameFocus,
      controller: _firstLastNameText,
      onChanged: (value) {
        setState(() {
          _cardHolderName = value;
        });
      },
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _firstLastNameFocus.hasFocus ? null : 'first_last_name'.tr,
        labelText: _validate
            ? (_firstLastNameFocus.hasFocus ? 'first_last_name'.tr : null)
            : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red,
            fontSize: _firstLastNameFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'first_last_name'.tr + 'не введены';
        }
        return null;
      },
      onTap: () {
        _firstLastNameText.text = "";
      },
      onSaved: (String value) {
        _firstLastName = value;
      },
    );
  }

  Widget _buildCVV() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(3)],
      keyboardType: TextInputType.name,
      focusNode: _cvvFocus,
      controller: _cvvText,
      onChanged: (value) {
        setState(() {
          _cvv = value;
        });
      },
      style: Theme.of(context).textTheme.caption,
      decoration: InputDecoration(
        isDense: true,
        hintText: _cvvFocus.hasFocus ? null : 'cvc_cvv'.tr,
        labelText:
            _validate ? (_cvvFocus.hasFocus ? 'cvc_cvv'.tr : null) : null,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            .merge(TextStyle(color: Color.fromRGBO(110, 110, 110, 1))),
        labelStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
            color: Colors.red,
            fontSize: _cvvFocus.hasFocus ? 18.0 : 13.0)),
        contentPadding: EdgeInsets.only(bottom: 5.0),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'cvc_cvv'.tr + 'не введен';
        }
        return null;
      },
      onTap: () {
        _cvvText.text = "";
      },
      onSaved: (String value) {
        _cvvCVC = value;
      },
    );
  }

  void pressSave() {
    setState(() {
      _creditCardText.text.isEmpty ? _validate = true : _validate = false;
      _expirationDateText.text.isEmpty ? _validate = true : _validate = false;
      _firstLastNameText.text.isEmpty ? _validate = true : _validate = false;
      _cvvText.text.isEmpty ? _validate = true : _validate = false;
    });

    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print(_creditCards);
    print(_expirationDate);
    print(_firstLastName);
    print(_cvvCVC);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _creditCardFocus.dispose();
    _expirationDateFocus.dispose();
    _firstLastNameFocus.dispose();
    _cvvFocus.dispose();
    _creditCardText.dispose();
    _expirationDateText.dispose();
    _firstLastNameText.dispose();
    _cvvText.dispose();
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
    _creditCardFocus = FocusNode();
    _creditCardFocus.addListener(_focusNodeEvent);
    _expirationDateFocus = FocusNode();
    _expirationDateFocus.addListener(_focusNodeEvent);
    _firstLastNameFocus = FocusNode();
    _firstLastNameFocus.addListener(_focusNodeEvent);
    _cvvFocus = FocusNode();
    _cvvFocus.addListener(_focusNodeEvent);
  }

  _focusNodeEvent() {
    setState(() {});
  }
}
