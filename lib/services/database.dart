import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_44/screen/home/doctorlist.dart';
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
    //return khaganicollection.snapshots();
  }

  Stream<List<profileinfo>> get myprofile {
    return khaganicollection.snapshots().map(_profileinfolistfromsnapshot);
  }

  List<profileinfo> _profileinfolistfromsnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((docus) {
      return profileinfo(
          id: docus.id ?? '',
          name: docus.data()['name'] ?? '',
          speciality: docus.data()['speciality'] ?? '',
          city: docus.data()['city'] ?? '',
          lat: docus.data()['Lattitude'] ?? 0.0,
          lng: docus.data()['longitude'] ?? 0.0);
    }).toList();
  }
}

//this file is very important to me
/*Stream<List<docinfo>> get doctorinfo{
    return khaganicollection.snapshots().map(_docinfofromsnapshot);
  }
  List<docinfo> _docinfofromsnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((document){
      return docinfos(name:document.data.);
    }).toList;
  }*/
