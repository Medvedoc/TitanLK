import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getLogo(context);
  }

  Widget _getLogo(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
              ),
            ],
          ),
          _getModal(context),
        ],
      ),
    );
  }

  Widget _getModal(BuildContext context) {
    //var controller = new MaskedTextController(mask: '+0 (000) 000 00 00');
    return SizedBox(
      //width: MyStyleBase.sizedCard,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        color: Theme.of(context).textTheme.button.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "333",
                        //S.of(context).wfrsWelcomeHeading,
                        //style: MyStyleBase.textHeading,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "444",
                        //S.of(context).wfrsWelcomeDescription,
                        //style: MyStyleBase.textDescription,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: MyStyleBase.colorFilter[4],
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: TextFormField(
                            //controller: controller,
                            keyboardType: TextInputType.number,
                            //style: MyStyleBase.textField,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                              prefixIcon: Icon(
                                Icons.smartphone,
                                //size: MyStyleBase.sizedIcon,
                                //color: MyStyleBase.colorFilter[3],
                              ),
                              hintText: "+* (***) *** ** **",
                              //hintStyle: MyStyleBase.textField,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        //height: MyStyleBase.sizedButton,
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0.0,
                          //color: MyStyleBase.colorFilter[0],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                // color: MyStyleBase.colorFilter[1],
                                ),
                          ),
                          onPressed: () {},
                          child: Text("222"
                              // S.of(context).wfrsWelcomeSend,
                              // style: MyStyleBase.textButton1,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        // height: MyStyleBase.sizedButton,
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                //  color: MyStyleBase.colorFilter[0],
                                ),
                          ),
                          onPressed: () {},
                          child: Text("111"
                              // S.of(context).wfrsWelcomeRegister,
                              // style: MyStyleBase.textButton2,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
