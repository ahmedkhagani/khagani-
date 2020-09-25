import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_44/screen/home/kakan_list.dart';


class Marker extends StatefulWidget {
  @override
  _MarkerState createState() => _MarkerState();
}

class _MarkerState extends State<Marker> {

  /*List<Marker> mymarker = [];
  List<Marker> mymarker=[];

  handletap(LatLng tappedpoint) {
    print(tappedpoint);
    setState(() {
      mymarker = [];
      mymarker.add(Marker());
    });
  }*/
  var latt = doctormarker.latt;
  var lngg = doctormarker.lngg;

  /*Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  void onmapcreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker());
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('doctor address'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(latt, lngg),
              zoom: 10,
            ),

          ),
        ],
      ),
    );
  }
}
