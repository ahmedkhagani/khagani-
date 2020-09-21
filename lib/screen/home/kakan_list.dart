import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class KakanList extends StatefulWidget {
  @override
  _KakanListState createState() => _KakanListState();
}

class _KakanListState extends State<KakanList> {

  
  @override
  Widget build(BuildContext context) {
    final kakan = Provider.of<QuerySnapshot>(context);

    for ( var docus in kakan.docs){
      if (docus.data()['name']=='ahmed'){
        print(docus.data()['Latlng']);
      }
    }
    return Container();
  }
}
// important to me!!!!
//for ( var docus in kakan.docs){
//print(docus.data()['name']);
//}

