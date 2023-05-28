import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double lat = -29.692830906329835, long = -53.80942938166916;
  LatLng point = LatLng(-29.692830906329835, -53.80942938166916);
  List<LatLng> listaPoints = [
    LatLng(-29.692830906329835, -53.80942938166916),
  ];

  @override
  void initState() {
    _incrementMovimento();
    super.initState();
  }

  void _incrementMovimento() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        lat += 0.0001;
        long += 0.001;
        listaPoints[0] = LatLng(lat, long);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final markers = listaPoints.map((latlng) {
      return Marker(
        width: 80,
        height: 80,
        point: latlng,
        builder: (ctx) => const Icon(
          Icons.location_on,
          color: Colors.red,
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-29.692830906329835, -53.80942938166916),
          zoom: 14.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: markers,
          )
        ],
      ),
    );
  }

  void _handleTap(TapPosition tapPosition, LatLng latlng) {
    setState(() {
      listaPoints.add(latlng);
    });
  }
}
