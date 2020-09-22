import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/home2.dart';
import 'package:flutter_app_44/screen/home/the%20speciality.dart';
import 'package:flutter_app_44/services/patloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PatMap extends StatefulWidget {
  @override
  _PatMapState createState() => _PatMapState();
}

class _PatMapState extends State<PatMap> {
  var patLatlng;
  List<Marker> mymarker = [];

  handletap(LatLng tappedpoint) {
    print(tappedpoint);
    patLatlng = tappedpoint.toString();
    setState(() {
      mymarker = [];
      mymarker.add(Marker(
        markerId: MarkerId(patLatlng),
        position: tappedpoint,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Your current location'),
        actions: [
          RaisedButton(
            onPressed: () {
              pattloc(latlng: patLatlng);
            },
            child: Text('confirm'),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(33.312805, 44.361488),
              zoom: 8,
            ),
            markers: Set.from(mymarker),
            onTap: handletap,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(25.0),
            child: FloatingActionButton(
                backgroundColor: Colors.pinkAccent,
                child: Text(
                  'R',
                ),
                onPressed: () {
                  pattloc(latlng: patLatlng);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home2()));
                }),
          ),
        ],
      ),
    );
  }
}
