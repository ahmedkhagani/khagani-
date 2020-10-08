import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_44/screen/home/docposmap.dart';
import 'package:flutter_app_44/screen/home/home.dart';
import 'package:flutter_app_44/screen/home/patient%20map.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:flutter_app_44/services/patloc.dart';
import 'package:provider/provider.dart';

class KakanList extends StatefulWidget {
  @override
  _KakanListState createState() => _KakanListState();
}

class _KakanListState extends State<KakanList> {
  @override
  Widget build(BuildContext context) {
    final kakan = Provider.of<QuerySnapshot>(context);
    //final kakani =Provider.of<List<profileinfo>>(context);
    var patlatt = patloc.lat;
    var patlngg = patloc.lng;
    var sum = 0.0;
    var result = 0.0;
    double lati = 0.0;
    double longi = 0.0;
    double dist = 0.0;

    String name = '';
    String speciality = '';
    if(kakan!=null){
      for (var docus in kakan.docs) {
        print(docus.data()['Lattitude']);
        print(docus.data()['longitude']);
        lati = docus.data()['Lattitude'];
        longi = docus.data()['Lattitude'];
        sum = ((lati - patlatt) * (lati - patlatt)) +
            ((longi - patlngg) * (longi - patlngg));
        result = sqrt(sum);
        if (result > dist) {
          dist = result;
        }
        print(dist);
      }

      for (var docus in kakan.docs) {
        lati = docus.data()['Lattitude'];
        longi = docus.data()['longitude'];
        sum = ((lati - patlatt) * (lati - patlatt)) +
            ((longi - patlngg) * (longi - patlngg));
        result = sqrt(sum);
        if (result < dist) {
          dist = result;
          name = docus.data()['name'];
          speciality = docus.data()['speciality'];
          doctormarker.latt = lati;
          doctormarker.lngg = longi;
        }
        print(dist);
      }
    }


    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(dist.toString()),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(name),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(speciality),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Center(
                child: RaisedButton(
                    child: Text('go to google map'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DocPosMap(
                                lat: lati,
                                lng: longi,
                              )));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// important to me!!!!
//for ( var docus in kakan.docs){
//print(docus.data()['name']);
//}

class doctormarker {
  static double latt;
  static double lngg;
  static String latti = latt.toString();
  static String lnggi = lngg.toString();
}


