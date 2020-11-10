import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitanChooseContract extends StatefulWidget {
  @override
  _TitanChooseContractState createState() => _TitanChooseContractState();
}

class _TitanChooseContractState extends State<TitanChooseContract> {
  TextEditingController _textController = TextEditingController();

  static List<int> mainDataList = [
    112348, 234543, 567345, 345432, 435675
  ];

  // Copy Main List into New List.
  List<int> newDataList = List.from(mainDataList);
bool _reverse = false;
  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toString().toLowerCase().contains(value.toString().toLowerCase()))
          .toList();
    });
  }

  final List<int> entries = <int>[112348, 234543, 567345, 345432, 435675];
  final List<int> colorCodes = <int>[600, 500, 100, 200, 300];
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FlatButton(
        child: Text('data'),
        onPressed: () {
          setState(() {
            newDataList.sort();
            _reverse=!_reverse;
            
          });
        },
      ),
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

      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Search Here...',
          ),
          onChanged: onItemChanged,
        ),
      ),
      ListView.separated(
        reverse: _reverse,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: newDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            //color: Colors.amber[colorCodes[index]],
            child: Center(child: Text(newDataList[index].toString())),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    ]);
  }
}
