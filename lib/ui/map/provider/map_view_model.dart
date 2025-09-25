import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  GoogleMapController? mapController;

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  final LatLng startPoint = LatLng(41.2100, 69.2317);
  final LatLng endPoint = LatLng(41.2995, 69.2401);

  MapViewModel() {
    _setMarkers();
    _drawSimpleRoute();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _setMarkers() {
    markers.add(
      Marker(
        markerId: const MarkerId("start"),
        position: startPoint,
        infoWindow: const InfoWindow(title: "A nuqta"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("end"),
        position: endPoint,
        infoWindow: const InfoWindow(title: "B nuqta"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  void _drawSimpleRoute() {
    final PolylineId polylineId = const PolylineId('route_1');
    final Polyline polyline = Polyline(
      polylineId: polylineId,
      color: Colors.blue,
      width: 5,
      points: [startPoint, endPoint], // faqat A va B orasida chiziq
    );

    polylines.add(polyline);
    notifyListeners();
  }
}
