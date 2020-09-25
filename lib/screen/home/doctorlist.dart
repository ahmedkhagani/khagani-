import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:flutter_app_44/models/user.dart';

class DocList extends StatefulWidget {
  @override
  _DocListState createState() => _DocListState();
}

class _DocListState extends State<DocList> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    final prof = Provider.of<QuerySnapshot>(context);
    print(uid);
    String latt;
    String lngg;
    String name;
    String speciality;
    for (var proof in prof.docs) {
      if (proof.id == uid) {
        print(proof.data()['Lattitude']);
        print(proof.data()['longitude']);
        print(proof.data()['name']);
        print(proof.data()['speciality']);
        latt = proof.data()['Lattitude'].toString();
        lngg = proof.data()['longitude'].toString();
        name = proof.data()['name'];
        speciality = proof.data()['speciality'];
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                latt,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                lngg,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                speciality,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
