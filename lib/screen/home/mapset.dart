import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/home.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/models/user.dart';

class MapSet extends StatefulWidget {
  String value;

  final Function setti;
  final Function sett;
  MapSet({this.setti, this.sett, this.value});
  printname() {
    print(value);
  }

  String named = '';


  @override
  _MapSetState createState() => _MapSetState(val: value, named: named);
}

class _MapSetState extends State<MapSet> {
  String named;
  String val;

  _MapSetState({this.val, this.named});

  final AuthService _auth = AuthService();

  var Latlngs;
  List<Marker> mymarker = [];

  handletap(LatLng tappedpoint) {
    print(tappedpoint);
    Latlngs = tappedpoint.toString();
    setState(() {
      mymarker = [];
      mymarker.add(Marker(
        markerId: MarkerId(Latlngs),
        position: tappedpoint,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('settings'),
        actions: [
          FlatButton(
              onPressed: () {

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
              onPressed: () async {

                await DatabaseService(uid: user.uid)
                    .updateuserdata(val, Latlngs);
                print(val);
                print(Latlngs);
                Navigator.pop(context);
                //Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
