import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_44/services/auth.dart';

class DatabaseService {
  final CollectionReference khaganicollection =
      FirebaseFirestore.instance.collection('alkhagani');

  final String uid;
  DatabaseService({this.uid});

  Future updateuserdata(String name, double Lat, double lng, String speciality,
      String city) async {
    return await khaganicollection.doc(uid).set({
      'name': name,
      'Lattitude': Lat,
      'longitude': lng,
      'speciality': speciality,
      'city': city
    });
  }
  /*Future deletedata (uid)async{
    await khaganicollection.doc(uid).delete();
  }*/

  Stream<QuerySnapshot> get kakan {
    return khaganicollection.snapshots();
  }

  Stream<QuerySnapshot> get profile {
    return khaganicollection.snapshots();
  }
}
//this file is very important to me
