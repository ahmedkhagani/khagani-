import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_44/screen/authenticate/register.dart';

class Maps extends StatefulWidget {
  final Function map;
  String email;
  String password;
  String name;
  String speciality;
  String city;
  Maps(
      {this.map,
      this.email,
      this.password,
      this.name,
      this.speciality,
      this.city});

  @override
  _MapsState createState() => _MapsState(
      email: email,
      password: password,
      name: name,
      speciality: speciality,
      city: city);
}

class _MapsState extends State<Maps> {
  String email;
  String password;
  String name;
  String speciality;
  String city;
  _MapsState(
      {this.email, this.password, this.name, this.speciality, this.city});

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

  double lattt;
  double lnggg;

  geolocate({String latlng}) {
    var firstindex = latlng.indexOf('(');
    var secondindex = latlng.indexOf(',');
    var thirdindex = latlng.indexOf(')');
    String lat = latlng.substring(firstindex + 1, secondindex);
    String lng = latlng.substring(secondindex + 1, thirdindex);

    lattt = double.parse(lat);
    lnggg = double.parse(lng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Register'),
        elevation: 4,
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
              onPressed: () async {
                await geolocate(latlng: Latlng);
                dynamic result = await _auth.registerwithemailandpassword(
                    email, password, name, lattt, lnggg, speciality, city);
                if (result == null) {
                  setState(() {
                    error.errors =
                        'Invalid credentials or Internet connection error';
                  });
                }

                await Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class error {
  static String errors = '';
}
