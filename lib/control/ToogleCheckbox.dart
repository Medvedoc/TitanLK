/*import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToogleCheckbox extends StatefulWidget {
  //double abc;
  Function(bool) callback;
  final bool isChecked;
  final int number;
  final Function() toggleCheckbox;

  ToogleCheckbox(
      {this.isChecked,
      this.number,
      this.toggleCheckbox,
      //this.abc,
      this.callback});

  @override
  _ToogleCheckboxState createState() => _ToogleCheckboxState();
}

class _ToogleCheckboxState extends State<ToogleCheckbox> {
  bool visibilityObs = false;
  bool isChecked;

  @override
  Widget build(BuildContext context) {
    isChecked = widget.isChecked ==true ? widget.isChecked : !widget.isChecked;
    return Column(
      children: [
        SizedBox(height: 30.0),
        Text('$isChecked'),
        SizedBox(height: 30.0),
        Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              (widget.isChecked == true ? !visibilityObs : visibilityObs)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            toggleCheckbox(value);
                            _changed(true, widget.number.toString());

                            widget.callback(isChecked);
                          },
                        ),
                        Text("Observation")
                      ],
                    )
                  : Container(),
              SizedBox(height: 10.0),
            ],
          ),
        ),
        SizedBox(height: 30.0),
        Container(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              (widget.isChecked == true ? visibilityObs : !visibilityObs)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: !isChecked,
                          onChanged: (value) {
                            toggleCheckbox(value);
                            _changed(false, widget.number.toString());
                            widget.callback(!isChecked);
                          },
                        ),
                        Text("Observation")
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }

  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      setState(() {
        isChecked = true;
      });
    } else {
      setState(() {
        isChecked = false;
      });
    }
  }

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == widget.number.toString()) {
        widget.isChecked == true
            ? visibilityObs = visibility
            : visibilityObs = !visibility;
        //visibilityObs = visibility;
      }
    });
  }
}*/

//рАБОЧАЯ ВЕРСИЯ
/*import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToogleCheckbox extends StatefulWidget {
  Function(List<bool>) callback;
  final List<bool> isChecked;
  final List<String> textHeading;
  final Function() toggleCheckbox;

  ToogleCheckbox(
      {this.isChecked,
      this.textHeading,
      this.toggleCheckbox,
      //this.abc,
      this.callback});

  @override
  _ToogleCheckboxState createState() => _ToogleCheckboxState();
}

class _ToogleCheckboxState extends State<ToogleCheckbox> {
  bool visibilityObs = false;
  List<bool> isChecked;
  int number;

  @override
  void initState() {
    super.initState();
    number = 1;
    for (var i = 0; i < widget.isChecked.length; i++) {
      if (widget.isChecked[i] == true) {
        number += 1;
      }
    }
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.0),
        number > 1
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: widget.isChecked.length,
                  itemBuilder: (BuildContext context, int index) {
                    //isChecked[index] = widget.isChecked[index] == true ? widget.isChecked[index] : !widget.isChecked[index];
                    return (widget.isChecked[index] == true
                            ? !visibilityObs
                            : visibilityObs)
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: widget.isChecked[index],
                                  onChanged: (value) {
                                    setState(() {
                                      number -= 1;
                                      print(number);
                                    });
                                    widget.isChecked[index] == false
                                        ? setState(() {
                                            widget.isChecked[index] = true;
                                          })
                                        : setState(() {
                                            widget.isChecked[index] = false;
                                          });

                                    widget.isChecked[index] == true
                                        ? visibilityObs = true
                                        : visibilityObs = false;

                                    widget.callback(widget.isChecked);
                                  },
                                ),
                                Text(widget.textHeading[index])
                              ],
                            ),
                          )
                        : Container(margin: EdgeInsets.zero);
                  },
                ),
              )
            : SizedBox(),
        SizedBox(height: 30.0),
        number <= widget.isChecked.length
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: widget.isChecked.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (widget.isChecked[index] == true
                            ? visibilityObs
                            : !visibilityObs)
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: widget.isChecked[index],
                                  onChanged: (value) {
                                    setState(() {
                                      number += 1;
                                      print(number);
                                    });
                                    widget.isChecked[index] == false
                                        ? setState(() {
                                            widget.isChecked[index] = true;
                                          })
                                        : setState(() {
                                            widget.isChecked[index] = false;
                                          });
                                    widget.isChecked[index] == true
                                        ? visibilityObs = false
                                        : visibilityObs = true;
                                    widget.callback(widget.isChecked);
                                  },
                                ),
                                Text(widget.textHeading[index])
                              ],
                            ),
                          )
                        : Container();
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

*/















import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToogleCheckbox extends StatefulWidget {
  Function(List<bool>) callback;
  final List<bool> isChecked;
  final List<String> textHeading;
  final List<String> textDate;
  final Function() toggleCheckbox;

  ToogleCheckbox(
      {this.isChecked,
      this.textHeading,
      this.textDate,
      this.toggleCheckbox,
      //this.abc,
      this.callback});

  @override
  _ToogleCheckboxState createState() => _ToogleCheckboxState();
}

class _ToogleCheckboxState extends State<ToogleCheckbox> {
  TextEditingController searchController = new TextEditingController();
  String filter;
  bool visibilityObs = false;
  List<bool> isChecked;
  int number;
  int number2;
  int blue;
  int green;

  @override
  void initState() {
    super.initState();
    number = 0;
    number2 = widget.textHeading.length;
    for (var i = 0; i < widget.isChecked.length; i++) {
      if (widget.isChecked[i] == true) {
        number += 1;
      }
    }
    //print(number);

    _phoneFocus = new FocusNode();
    _phoneFocus.addListener(_focusNodeEvent);

    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  _focusNodeEvent() {
    setState(() {});
  }

  FocusNode _phoneFocus;

  final _phoneText = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
    _phoneFocus.dispose();
  }

  int nums = 0;
  @override
  Widget build(BuildContext context) {
                    print('blue ${widget.isChecked}');
    return Column(
      children: [
        SizedBox(height: 30.0),
        TextFormField(
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
        number >= 1
            ? Container(
                /*margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),*/
                child: ListView.builder(
                  shrinkWrap: true,
                  //padding: const EdgeInsets.all(8),
                  itemCount: widget.textHeading.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (widget.isChecked[index] == true
                            ? !visibilityObs
                            : visibilityObs)
                        ? filter == null || filter == ""
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: widget.isChecked[index],
                                            onChanged: (value) {
                                              setState(() {
                                                number -= 1;
                                                number2 =
                                                    widget.textHeading.length -
                                                        number;
                                              });
                                              widget.isChecked[index] == false
                                                  ? setState(() {
                                                      widget.isChecked[index] =
                                                          true;
                                                    })
                                                  : setState(() {
                                                      widget.isChecked[index] =
                                                          false;
                                                    });

                                              widget.isChecked[index] == true
                                                  ? visibilityObs = true
                                                  : visibilityObs = false;

                                              widget.callback(widget.isChecked);
                                            },
                                          ),
                                          Text(
                                              '№ ${widget.textHeading[index]}'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child:
                                          Text('от ${widget.textDate[index]}'),
                                    )
                                  ],
                                ),
                              )
                            : '${widget.textHeading[index]}'
                                    .toLowerCase()
                                    .contains(filter.toLowerCase())
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: widget.isChecked[index],
                                                onChanged: (value) {
                                                  setState(() {
                                                    number -= 1;
                                                    number2 = widget.textHeading
                                                            .length -
                                                        number;
                                                  });
                                                  widget.isChecked[index] ==
                                                          false
                                                      ? setState(() {
                                                          widget.isChecked[
                                                              index] = true;
                                                        })
                                                      : setState(() {
                                                          widget.isChecked[
                                                              index] = false;
                                                        });

                                                  widget.isChecked[index] ==
                                                          true
                                                      ? visibilityObs = true
                                                      : visibilityObs = false;

                                                  widget.callback(
                                                      widget.isChecked);
                                                },
                                              ),
                                              Text(
                                                  '№ ${widget.textHeading[index]}'),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                              'от ${widget.textDate[index]}'),
                                        )
                                      ],
                                    ),
                                  ): Container(margin: EdgeInsets.zero)
                        : Container(margin: EdgeInsets.zero);
                  },
                ),
              )
            : SizedBox(),
            
        number < widget.isChecked.length
            ? Container(
                /*margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),*/
                child: ListView.builder(
                  shrinkWrap: true,
                  //padding: const EdgeInsets.all(8),
                  itemCount: widget.isChecked.length,
                  itemBuilder: (BuildContext context, int index) {
                    print('green ${widget.isChecked}');
                    /*widget.textHeading[index].contains('$filter')
                        ? print('green filter ${number-1}')
                        : print('green nofilter $number');*/
                    //texts = widget.textHeading[index];
                    // texts==widget.textHeading[index]?number = number-1:number = number;
                    return (widget.isChecked[index] == true
                            ? visibilityObs
                            : !visibilityObs)
                        ? filter == null || filter == ""
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: widget.isChecked[index],
                                            onChanged: (value) {
                                              setState(() {
                                                number += 1;
                                                number2 =
                                                    widget.textHeading.length -
                                                        number;
                                              });
                                              widget.isChecked[index] == false
                                                  ? setState(() {
                                                      widget.isChecked[index] =
                                                          true;
                                                    })
                                                  : setState(() {
                                                      widget.isChecked[index] =
                                                          false;
                                                    });
                                              widget.isChecked[index] == true
                                                  ? visibilityObs = false
                                                  : visibilityObs = true;
                                              widget.callback(widget.isChecked);
                                            },
                                          ),
                                          Text(
                                              '№ ${widget.textHeading[index]}'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child:
                                          Text('от ${widget.textDate[index]}'),
                                    )
                                  ],
                                ),
                              )
                            : '${widget.textHeading[index]}'
                                    .toLowerCase()
                                    .contains(filter.toLowerCase())
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: widget.isChecked[index],
                                                onChanged: (value) {
                                                  setState(() {
                                                    number += 1;
                                                    number2 = widget.textHeading
                                                            .length -
                                                        number;
                                                  });
                                                  widget.isChecked[index] ==
                                                          false
                                                      ? setState(() {
                                                          widget.isChecked[
                                                              index] = true;
                                                        })
                                                      : setState(() {
                                                          widget.isChecked[
                                                              index] = false;
                                                        });
                                                  widget.isChecked[index] ==
                                                          true
                                                      ? visibilityObs = false
                                                      : visibilityObs = true;
                                                  widget.callback(
                                                      widget.isChecked);
                                                },
                                              ),
                                              Text(
                                                  '№ ${widget.textHeading[index]}'),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                              'от ${widget.textDate[index]}'),
                                        )
                                      ],
                                    ),
                                  )
                                : Container()
                        : Container();
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
