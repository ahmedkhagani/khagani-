import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/doctorlist.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:provider/provider.dart';

class HomeDoc extends StatefulWidget {
  @override
  _HomeDocState createState() => _HomeDocState();
}

class _HomeDocState extends State<HomeDoc> {
  var uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<profileinfo>>.value(
                value: DatabaseService().myprofile) ==
            null
        ? Container()
        : StreamProvider<List<profileinfo>>.value(
            //initialData: ,
            value: DatabaseService().myprofile,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.pinkAccent,
                title: Text('my profile'),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DocList(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
