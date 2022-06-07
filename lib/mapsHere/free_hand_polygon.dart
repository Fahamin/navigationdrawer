import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class FreeHandPolygon extends StatefulWidget {
  const FreeHandPolygon({Key? key}) : super(key: key);

  @override
  State<FreeHandPolygon> createState() => _FreeHandPolygonState();
}

class _FreeHandPolygonState extends State<FreeHandPolygon> {
  static final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Set<Polygon> _polygons = HashSet<Polygon>();
  final Set<Polyline> _polyLines = HashSet<Polyline>();

  bool _drawPolygonEnabled = false;
  List<LatLng> _userPolyLinesLatLngList = [];
  bool _clearDrawing = false;
  late int _lastXCoordinate, _lastYCoordinate;

  Set<Polygon> myPolygon() {

    List<LatLng> polygonCoords = [];
    polygonCoords.add(LatLng(37.43296265129, -122.088357078792));
    polygonCoords.add(LatLng(37.6265331129, -122.08832078792));
    polygonCoords.add(LatLng(37.43006265129, -122.083357078792));
    polygonCoords.add(LatLng(37.45331129, -122.08832078792));
    polygonCoords.add(LatLng(37.4265331129, -122.0883235702));

    for(int i=0 ;i<polygonCoords.length;i++)
      {
        addMarkerlist(polygonCoords.elementAt(i));
        print(""+ polygonCoords.elementAt(i).toString());
      }

    Set<Polygon> polygonSet = new Set();
    polygonSet.add(Polygon(
        polygonId: PolygonId('test'),
        points: polygonCoords,
        strokeColor: Colors.red,
    strokeWidth: 2));

    return polygonSet;
  }

  Set<Polyline> myPolyline()
  {
    List<LatLng> polygonCoords = [];
    polygonCoords.add(LatLng(37.43265129, -122.088078792));
    polygonCoords.add(LatLng(37.62651129, -122.088378792));
    polygonCoords.add(LatLng(37.436265129, -122.0833570787));
    polygonCoords.add(LatLng(37.45331129, -122.088320782));
    polygonCoords.add(LatLng(36.4265331129, -122.08832302));

    for(int i=0 ;i<polygonCoords.length;i++)
    {
      addMarkerlist(polygonCoords.elementAt(i));
      print(""+ polygonCoords.elementAt(i).toString());
    }

    Set<Polyline> polylineSet = new Set();
    polylineSet.add(Polyline(polylineId: PolylineId("polyline"),
    points: polygonCoords,
    color: Colors.blue,
    width: 3));
    return polylineSet;
  }

  List<Marker> _markers = <Marker>[];
  void addMarkerlist(LatLng latLng) {
   // _markers.clear();
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: latLng,
        infoWindow: InfoWindow(title: 'The title of the marker')));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(

        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          polygons: myPolygon(),
          polylines: myPolyline(),
         markers: _markers.toSet(),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),

    );
  }

}