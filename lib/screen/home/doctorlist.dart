import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/docposmap.dart';
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
    final prof = Provider.of<List<profileinfo>>(context);
    String latt = '';
    String lngg = '';
    String name = '';
    String speciality = '';
    String city='';
    double lati;
    double lngi;
    if (prof != null) {
      prof.forEach((profy) {
        print(profy.id);
        print(profy.name);
        print(profy.speciality);
        print(profy.lat);
        print(profy.lng);
        if (profy.id == uid) {
          name = profy.name;
          speciality = profy.speciality;
          latt = profy.lat.toString();
          lngg = profy.lng.toString();
          city = profy.city;
        }
      });
    }

    /*for (var proof in prof.docs) {
      if (proof.id == uid) {
        print(proof.data()['Lattitude']);
        print(proof.data()['longitude']);
        print(proof.data()['name']);
        print(proof.data()['speciality']);
        latt = proof.data()['Lattitude'].toString();
        lngg = proof.data()['longitude'].toString();
        name = proof.data()['name'];
        speciality = proof.data()['speciality'];
        lati = proof.data()['Lattitude'];
        lngi = proof.data()['longitude'];
      }
    }*/

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
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                city,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            /*RaisedButton(
              child: Text('show doctor location'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DocPosMap(
                          lat: lati,
                          lng: lngi,
                        )));
              },
            ),*/
          ],
        ),
      ),
    );
  }
}

class profileinfo {
  var id;
  String name = '';
  String speciality = '';
  String city='';
  double lat = 0.0;
  double lng = 0.0;
  profileinfo({this.id, this.name, this.speciality,this.city, this.lat, this.lng});
}
