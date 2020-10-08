import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/doctorlist.dart';
import 'package:flutter_app_44/screen/home/homedoctor.dart';

import 'package:flutter_app_44/screen/home/kakan_list.dart';
import 'package:flutter_app_44/screen/home/patient%20map.dart';
import 'package:flutter_app_44/screen/home/setter.dart';
import 'package:flutter_app_44/screen/home/the%20speciality.dart';
import 'package:flutter_app_44/screen/home/updatepass.dart';
import 'package:flutter_app_44/screen/home/wrapper.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:flutter_app_44/services/final%20score.dart';
import 'package:flutter_app_44/services/symptom2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/screen/authenticate/map.dart';
import 'package:flutter_app_44/services/symptoms.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _emailverified = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    Future(() async {
      _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
        await FirebaseAuth.instance.currentUser
          ..reload();
        var user = FirebaseAuth.instance.currentUser;
        if (user.emailVerified) {
          setState(() {
            _emailverified = user.emailVerified;
            verified.verify = user.emailVerified;
          });
          timer.cancel();
        }
      });
    });
  }

  final AuthService _auth = AuthService();

  String chief;

  String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Setter()));
            },
            label: Text('reset'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    chief = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'enter a chief complaint',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  //Disease(chief: chief);
                  maindisease2(chiefcomp: chief);
                  countthe();

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Speciality(),
                  ));
                },
                child: Text('send'),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('show result'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => PatMap()));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                  child: Text('show me my profile'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeDoc()));
                  }),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Update()));
                },
                child: Text('update'),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('Go To Mcqs'),
                onPressed: () {
                  Navigator.pushNamed(context, '/mcqs');
                },
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}

