import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/kakan_list.dart';
import 'package:flutter_app_44/screen/home/setter.dart';
import 'package:flutter_app_44/screen/home/the%20speciality.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:flutter_app_44/services/final%20score.dart';
import 'package:flutter_app_44/services/symptom2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/screen/authenticate/map.dart';
import 'package:flutter_app_44/services/symptoms.dart';

class Home extends StatefulWidget {
  final Function sett;
  final Function getscore;

  Home({this.getscore, this.sett});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  final AuthService _auth = AuthService();

  String chief;

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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setter()));
              },
              label: Text('reset'),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              KakanList(),
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
                onPressed: () async {
                  //Disease(chief: chief);
                  maindisease2(chiefcomp: chief);
                  countthe();

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Speciality(),
                  ));
                },
                child: Text('send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
