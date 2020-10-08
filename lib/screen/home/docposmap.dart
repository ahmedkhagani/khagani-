import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DocPosMap extends StatefulWidget {
  double lat;
  double lng;
  DocPosMap({this.lat, this.lng});
  @override
  _DocPosMapState createState() => _DocPosMapState(lat: lat, lng: lng);
}

class _DocPosMapState extends State<DocPosMap> {
  double lat;
  double lng;
  _DocPosMapState({this.lat, this.lng});

  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  void _onmapcreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
        markerId:
            MarkerId('Latlng(' + lat.toString() + ',' + lng.toString() + ')'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: 'the appropraite doctor'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Doctor Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onmapcreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, lng),
              zoom: 10,
            ),
            markers: _markers,
          ),
        ],
      ),
    );
  }
}
