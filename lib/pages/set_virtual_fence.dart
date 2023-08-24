import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../shared/property.dart';

class VirtualFencePage extends StatelessWidget {
  final Property property;
  const VirtualFencePage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selecione a propriedade")),
      body: FlutterMap(
        options: MapOptions(
          onTap: (position, point) {
            log("TapPosition: $position \n point: $point");
            property.cercaVirtual.add(point);
          },
          center: LatLng(-29.692830906329835, -53.80942938166916),
          zoom: 14.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          GetBuilder<Property>(builder: (context) {
            return MarkerLayer(
              markers: toMarkersList(property.cercaVirtual),
            );
          }),
        ],
      ),
    );
  }

  List<Marker> toMarkersList(List<LatLng> points) {
    List<Marker> markers = [];

    for (LatLng latlng in points) {
      markers.add(Marker(
          width: 80,
          height: 80,
          point: latlng,
          builder: (ctx) => const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 30,
              )));
    }

    return markers;
  }
}
