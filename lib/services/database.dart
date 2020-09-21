import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference khaganicollection =
      FirebaseFirestore.instance.collection('alkhagani');

  final String uid;
  DatabaseService({this.uid});

  Future updateuserdata(String name ,String Latlng)async{
    return await khaganicollection.doc(uid).set({
      'name':name,
      'Latlng':Latlng
    });
  }

  Stream<QuerySnapshot> get kakan {
    return khaganicollection.snapshots();
  }
}
//this file is very important to me