import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../model/property.dart';

class VirtualFencePage extends StatefulWidget {
  const VirtualFencePage({super.key});

  @override
  State<VirtualFencePage> createState() => _VirtualFencePageState();
}

class _VirtualFencePageState extends State<VirtualFencePage> {
  Property property = Property("Casa1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selecione a propriedade")),
      body: FlutterMap(
        options: MapOptions(
          onTap: (position, point) {
            log("TapPosition: $position \n point: $point");
            setState(() {
              property.cercaVirtual.add(point);
            });
          },
          center: const LatLng(-29.692830906329835, -53.80942938166916),
          zoom: 14.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: toMarkersList(property.cercaVirtual),
          ),
          if (property.cercaVirtual.length == 2)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: property.cercaVirtual,
                  strokeWidth: 4,
                  color: Colors.green,
                )
              ],
            ),
          if (property.cercaVirtual.length > 2)
            PolygonLayer(polygons: [
              Polygon(
                points: property.cercaVirtual,
                borderColor: Colors.green,
                borderStrokeWidth: 4,
              )
            ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              property.cercaVirtual.clear();
            });
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.cancel)),
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
                color: Colors.green,
                size: 30,
              )));
    }

    return markers;
  }
}
