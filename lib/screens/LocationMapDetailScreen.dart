import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMapDetailScreen extends StatefulWidget {
  @override
  _LocationMapDetailScreenState createState() => _LocationMapDetailScreenState();
}

class _LocationMapDetailScreenState extends State<LocationMapDetailScreen> {
  static final CameraPosition _kGooglePlex = CameraPosition( target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  static final CameraPosition _kLake = CameraPosition( bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 19.151926040649414 );
  Completer<GoogleMapController> _controller = Completer();
  String mapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('resources/json/map_style.json').then((data){ mapStyle = data; });
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    print(arguments["address"]);
    return Scaffold(
      appBar: AppBar( title: Text(arguments["address"], style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold))),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController googleMapController){
          googleMapController.setMapStyle(mapStyle);
          _controller.complete(googleMapController);
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }
}
