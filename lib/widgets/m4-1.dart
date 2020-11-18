import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitanChooseContract extends StatefulWidget {
  @override
  _TitanChooseContractState createState() => _TitanChooseContractState();
}

class _TitanChooseContractState extends State<TitanChooseContract> {
  TextEditingController searchController = new TextEditingController();
  String filter;

















  FocusNode _phoneFocus;

  final _phoneText = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
    _phoneFocus.dispose();






  }

  @override
  void initState() {
    super.initState();
    _phoneFocus = new FocusNode();
    _phoneFocus.addListener(_focusNodeEvent);
    newDataList.sort();

    newList1 = [];
    newList2 = [];
    for (var i = 0; i < stroke.length; i++) {
      newList1.add(stroke[i][0]);
    }




















    
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  



  _focusNodeEvent() {
    setState(() {});
  }

  static List<int> mainDataList = [112348, 234543, 567345, 345432, 435675];

  static List<int> newDataList2 = [1212348, 4234543, 7567345, 1345432, 2435675];

  static List<int> newDataList3 = [1712348, 9234543, 1567345, 3345432, 1435675];

  // Copy Main List into New List.
  List<int> newDataList = List.from(mainDataList);
  bool _reverse = false;
  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase()))
          .toList();
    });
  }

  

  List<List<dynamic>> stroke = [
    [
      '112348',
      '03.10.2020',
      'ООО “1 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '312348',
      '05.10.2020',
      'ООО “ 6 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '412348',
      '08.10.2020',
      'ООО “9 Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
    [
      '212348',
      '04.10.2020',
      'ООО “44Охранная фирма “Титан”',
      'ООО “Фирма заказчика”',
      'ТО Охранная сигнализация ТО Пожарная сигнализация КТС'
    ],
  ];
  List newList1 = [];
  List newList2 = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /*ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),*/

          SizedBox(height: 40.0),
          Row(
            children: [
              Flexible(
                child: _buildPhone(),
              ),
              FlatButton(
                child: Text('data'),
                onPressed: () {
                  setState(() {
                    _reverse = !_reverse;

                    if (_reverse == true) {
                      newList1.sort();
                      newList2.clear();
                      for (var a = 0; a < newList1.length; a++) {
                        for (var c = 0; c < stroke.length; c++) {
                          if (stroke[c].contains(newList1[a])) {
                            newList2.add(stroke[c]);
                          }
                        }
                      }
                      stroke.clear();
                      for (var k = 0; k < newList2.length; k++) {
                        stroke.add(newList2[k]);
                      }
                      
                    } else if(_reverse !=true) {
                      newList1 = newList1.reversed.toList();
                      newList2.clear();
                      for (var a = 0; a < newList1.length; a++) {
                        for (var c = 0; c < stroke.length; c++) {
                          if (stroke[c].contains(newList1[a])) {
                            newList2.add(stroke[c]);
                          }
                        }
                      }
                      stroke.clear();
                      for (var k = 0; k < newList2.length; k++) {
                        stroke.add(newList2[k]);
                      }
                    }
                  });
                },
              ),
            ],
          ),
          ListView.builder(
            key: new Key(stroke.length.toString()),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: stroke.length,
            itemBuilder: (BuildContext context, int index) {
              return filter == null || filter == "" ? Column(
                children: [
                  Text('№ ${stroke[index][0]}'),
                  Text('от ${stroke[index][1]}'),
                  Text(stroke[index][2]),
                  Text(stroke[index][3]),
                  Text(stroke[index][4]),
                ],
              )
                      : '${stroke[index][0]}'.toLowerCase()
                              .contains(filter.toLowerCase())
                          ? Column(
                children: [
                  Text('№ ${stroke[index][0]}'),
                  Text('от ${stroke[index][1]}'),
                  Text(stroke[index][2]),
                  Text(stroke[index][3]),
                  Text(stroke[index][4]),
                ],
              ):SizedBox();

              /*Container(
              height: 50,
              //color: Colors.amber[colorCodes[index]],
              child: Center(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                          flex: 1, child: Text(newDataList[index].toString())),
                      Flexible(
                          flex: 2, child: Text(newDataList2[index].toString())),
                      Flexible(
                          flex: 1, child: Text(newDataList3[index].toString())),
                    ]),
              ),
            );*/

              /*Container(
              height: 50,
              //color: Colors.amber[colorCodes[index]],
              child: Center(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                          flex: 1, child: Text(newDataList[index].toString())),
                      Flexible(
                          flex: 2, child: Text(newDataList2[index].toString())),
                      Flexible(
                          flex: 1, child: Text(newDataList3[index].toString())),
                    ]),
              ),
            );*/
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPhone() {
    return Container(
      child: TextFormField(
                controller: searchController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        focusNode: _phoneFocus,
        style: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        //controller: _phoneText,
        decoration: InputDecoration(
          hintText: _phoneFocus.hasFocus ? null : 'Поиск...',
          hintStyle: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(110, 110, 110, 1),
          ),
        ),
        onTap: () {
          _phoneText.text = "";
        },
      ),
    );
  }
}
