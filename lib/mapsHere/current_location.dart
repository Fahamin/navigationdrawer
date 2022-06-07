import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-23.795039, -90.414465),
    zoom: 14.4746,
  );
  late LatLng latLng;

  LatLng latLng2 = LatLng(23.795039, 90.414465);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addMarkerlist(latLng2);
    _determinePosition();
    _getLastLocation();
  }

  List<Marker> _markers = <Marker>[];
  void addMarkerlist(LatLng latLng) {
    _markers.clear();
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: latLng,
        infoWindow: InfoWindow(title: 'The title of the marker')));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getLastLocation,
        label: Text('where i am!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  _getLastLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    latLng = new LatLng(position.latitude, position.longitude);
    addMarkerlist(latLng);
    CameraPosition pp = CameraPosition(
      target: latLng,
      zoom: 14.4746,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(pp));
    print("log" + latLng.longitude.toString());
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

}
