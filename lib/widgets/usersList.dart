import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 200, 45, 1),
        centerTitle: true,
        title: Text("СПИСОК ПОЛЬЗОВАТЕЛЕЙ"),
      ),
    );
  }
}
