import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/kakan_list.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/screen/authenticate/map.dart';

class Home extends StatefulWidget {
  final Function sett;

  Home({this.sett});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().kakan,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('Medimagazine'),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Log Out'),
              onPressed: () async {
                await _auth.SignOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              onPressed: () {
                widget.sett();
              },
              label: Text('reset'),
            )
          ],
        ),
        body: KakanList(),
      ),
    );
  }
}
