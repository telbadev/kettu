import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../provider/map_view_model.dart';


class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps Simple Route')),
      body: GoogleMap(
        onMapCreated: context.read<MapViewModel>().onMapCreated,
        initialCameraPosition: CameraPosition(
          target: context.watch<MapViewModel>().startPoint,
          zoom: 13.0,
        ),
        markers: context.watch<MapViewModel>().markers,
        polylines: context.watch<MapViewModel>().polylines,
      ),
    );
  }
}
