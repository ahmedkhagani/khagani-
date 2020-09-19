import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_44/screen/authenticate/register.dart';

class Maps extends StatefulWidget {
  final Function map;
  String email;
  String password;
  String name;
  Maps({this.map, this.email, this.password, this.name});

  @override
  _MapsState createState() =>
      _MapsState(email: email, password: password, name: name);
}

class _MapsState extends State<Maps> {
  String email;
  String password;
  String name;

  _MapsState({this.email, this.password, this.name});

  final AuthService _auth = AuthService();

  var Latlng;
  List<Marker> mymarker = [];

  handletap(LatLng tappedpoint) {
    print(tappedpoint);
    Latlng = tappedpoint.toString();
    setState(() {
      mymarker = [];
      mymarker.add(Marker(
        markerId: MarkerId(Latlng),
        position: tappedpoint,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Register'),
        actions: [
          FlatButton(
              onPressed: () {
                setState(() {
                  widget.map();
                });
              },
              child: Text('Back'))
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
                onPressed: () async{
                  dynamic result = await _auth.registerwithemailandpassword(
                      email, password, name, Latlng);
                  Navigator.pop(context);
                },
              ))
        ],
      ),
    );
  }
}
