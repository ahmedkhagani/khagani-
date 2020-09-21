import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/home.dart';
import 'package:flutter_app_44/screen/home/patient%20map.dart';
import 'package:flutter_app_44/services/patloc.dart';
import 'package:flutter_app_44/services/symptoms.dart';
import 'package:flutter_app_44/services/final score.dart';

class Speciality extends StatelessWidget {
  var scory = finalscore.specialities;
  var latt = patloc.lat;
  var lng = patloc.lng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('score'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 12.0,
            ),
            Text(
              scory,
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              latt.toString(),
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              lng.toString(),
              style: TextStyle(fontSize: 30.0),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: RaisedButton(
                  child: Text('go to google map'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PatMap()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

//final Function getscore;

//Speciality({this.getscore});
