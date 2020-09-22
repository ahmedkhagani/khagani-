import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/kakan_list.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:provider/provider.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var dist=getdist.dista;
  String name=getdist.docname;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().kakan,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('doctor information'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              KakanList(),
              SizedBox(height: 20.0,),
              Text(dist.toString(),),
              SizedBox(height: 20.0,),
              

            ],
          ),
        ),
      ),
    );
  }
}
