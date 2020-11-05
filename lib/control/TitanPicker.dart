import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image/control/TitanCheckbox.dart';
import 'package:flutter_image/control/TitanCheckbox2.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';

class TitanPicker extends StatefulWidget {
  final Function() onToogle;
  final List<double> border;
  final String textHeading;
  final bool isChecked;
  TitanPicker({
    this.onToogle,
    this.border,
    this.textHeading,
    this.isChecked,
  });
  @override
  _TitanPickerState createState() => _TitanPickerState();
}

class _TitanPickerState extends State<TitanPicker> {
  bool abc;

  callback(heightBlock) {
    setState(() {
      abc = heightBlock;
    });
  }

  String toTime = DateFormat.Hm().format(new DateTime.now());
  String fromTime = DateFormat.Hm().format(new DateTime.now());
  String toTimeHour;
  String toTimeMinute;
  String fromTimeHour;
  String fromTimeMinute;
  //bool isChecked = true;
  //bool isSwitched2 = true;
  //bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    abc = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    print(abc);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          top: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
            width: widget.border != null ? widget.border[0] : 1.0,
          ),
          right: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
            width: widget.border != null ? widget.border[1] : 1.0,
          ),
          bottom: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
            width: widget.border != null ? widget.border[2] : 1.0,
          ),
          left: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
            width: widget.border != null ? widget.border[3] : 1.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                //Text('$abc'),
                TitanCheckBox2(
                  //abc: widget.isChecked,
                  callback: callback,
                  isChecked11: abc != null ? abc : false,
                  onTap: (selected) {
                    setState(() {
                    });
                  },
                ),
                SizedBox(width: 10.0),
                Text(
                  widget.textHeading != null ? widget.textHeading : '',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'до ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    //color: Color.fromRGBO(0, 0, 0, abc != true ? 1 : 0.2),
                    color: Color.fromRGBO(0, 0, 0, abc == true ? 1 : 0.2),
                  ),
                ),
                SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showPickerNumberFormatValue(context);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 70.0,
                    height: 30.0,
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Color.fromRGBO(0, 0, 0, abc == true ? 1 : 0.2),
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: Text('$toTime',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(0, 0, 0, abc == true ? 1 : 0.2),
                        )),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'после ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color.fromRGBO(0, 0, 0, abc == true ? 1 : 0.2),
                  ),
                ),
                SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showPickerNumberFormatValue(context);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 70.0,
                    height: 30.0,
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Color.fromRGBO(0, 0, 0, abc == true ? 1 : 0.2),
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: Text('$fromTime',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(0, 0, 0, abc == true ? 1 : 0.2),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )

        /*Column(
              children: <Widget>[
                SizedBox(height: 16),
                Text('Default', style: Theme.of(context).textTheme.title),
                integerInfiniteNumberPicker,
                new RaisedButton(
                  onPressed: () => _showInfIntDialog(),
                  child: new Text("Current int value: $_currentInfIntValue"),
                ),
                Divider(color: Colors.grey, height: 32),
                Text('Decorated', style: Theme.of(context).textTheme.title),
                integerInfiniteDecoratedNumberPicker,
                Text(
                  "Current int value: $_currentInfIntValueDecorated",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )*/
        ;
  }

  showPickerNumberFormatValue(BuildContext context) {
    abc == true
        ? Picker(
            height: 150.0,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            cancelTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            confirmTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            selectedTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            cancelText: 'Выйти',
            confirmText: 'Выбрать',
            adapter: NumberPickerAdapter(data: [
              NumberPickerColumn(
                  begin: 0,
                  end: 23,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
              NumberPickerColumn(
                  begin: 0,
                  end: 59,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
            ]),
            delimiter: [
              PickerDelimiter(
                  child: Container(
                width: 10.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ))
            ],
            hideHeader: true,
            title: Text(
              "Выберите время",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
            onConfirm: (Picker picker, List value) {
              setState(() {
                toTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
                toTimeMinute = (value[1] < 10) ? "0${value[1]}" : "${value[1]}";
                toTime = '$toTimeHour:$toTimeMinute';
                //print(toTime);
              });
            }).showDialog(context)
        : SizedBox();
  }

  showPickerNumberFormatValue2(BuildContext context) {
    abc == true
        ? Picker(
            height: 150.0,
            textStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            cancelTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            confirmTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            selectedTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            cancelText: 'Выйти',
            confirmText: 'Выбрать',
            adapter: NumberPickerAdapter(data: [
              NumberPickerColumn(
                  begin: 0,
                  end: 23,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
              NumberPickerColumn(
                  begin: 0,
                  end: 59,
                  onFormatValue: (v) {
                    return v < 10 ? "0$v" : "$v";
                  }),
            ]),
            delimiter: [
              PickerDelimiter(
                  child: Container(
                width: 10.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ))
            ],
            hideHeader: true,
            onConfirm: (Picker picker, List value) {
              setState(() {
                fromTimeHour = (value[0] < 10) ? "0${value[0]}" : "${value[0]}";
                fromTimeMinute =
                    (value[1] < 10) ? "0${value[1]}" : "${value[1]}";
                fromTime = '$fromTimeHour:$fromTimeMinute';
                //  print(fromTime);
              });
            }).showDialog(context)
        : SizedBox();
  }
}
