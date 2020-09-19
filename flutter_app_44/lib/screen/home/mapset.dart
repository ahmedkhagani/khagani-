import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/models/user.dart';


class MapSet extends StatefulWidget {

  String namee;

  final Function setti;
  final Function sett;
  MapSet({this.setti,this.sett,this.namee});

  @override
  _MapSetState createState() => _MapSetState(namee:namee);
}

class _MapSetState extends State<MapSet> {



  String namee;

  _MapSetState({this.namee});

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
                widget.setti();
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
                  widget.sett();
                  await DatabaseService(uid: user.uid).updateuserdata(namee, Latlngs);
                  print(namee);
                  print(Latlngs);
                  //Navigator.pop(context);
                },
              ))
        ],
      ),
    );
  }
}
