import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    var patlatt = patloc.lat;
    var patlngg = patloc.lng;
    var sum=0.0;
    var result=0.0;
    double lati=0.0;
    double longi=0.0;
    double dist = 0.0;
    double dist2 = 0.0;
    String name='';

    for (var docus in kakan.docs) {
      print(docus.data()['Lattitude']);
      print(docus.data()['longitude']);
      lati=docus.data()['Lattitude'];
      longi=docus.data()['Lattitude'];
      sum=((lati-patlatt)*(lati-patlatt))+((longi-patlngg)*(longi-patlngg));
      result=sqrt(sum);
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
          name= docus.data()['name'];
        }
        print(dist);
        getdist.dista=dist;
        getdist.docname=name;
        print(getdist.dista);
        print(getdist.docname);
      }


    return Container();
  }
}
class getdist{
  static double dista;
  static String docname;
}
// important to me!!!!
//for ( var docus in kakan.docs){
//print(docus.data()['name']);
//}


/**/
