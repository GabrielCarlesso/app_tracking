import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';
import 'package:latlong2/latlong.dart';
import 'package:track_app/model/grid.dart';

class HeatMapPage extends StatefulWidget {
  const HeatMapPage({Key? key}) : super(key: key);

  @override
  State<HeatMapPage> createState() => _HeatMapPageState();
}

class _HeatMapPageState extends State<HeatMapPage> {
  LatLng centerMap = LatLng(-29.692830906329835, -53.80942938166916);

  List<WeightedLatLng> data = [];

  // mix of [coordinateDebugTileBuilder] and [loadingTimeDebugTileBuilder] from tile_builder.dart
  Widget tileBuilder(BuildContext context, Widget tileWidget, TileImage tile) {
    final coords = tile.coordinates;
    log("Cordenadas ${coords.toString()}");
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          tileWidget,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    GridUtils grid = GridUtils(centerMap);

    double weigth = 0.222; //Weigth ente 0 e 2
    for (int i = 0; i < grid.centerPoints.length; i++) {
      for (int j = 0; j < grid.centerPoints.length; j++) {
        data.add(WeightedLatLng(grid.centerPoints[i][j], (weigth * j)));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Heat map"),
      ),
      body: FlutterMap(
        options: MapOptions(
            center: centerMap,
            zoom: 18.4,
            maxZoom: 18.4,
            minZoom: 18.0,
            onTap: (position, point) {
              log("TapPosition: ${position.global} \n point: $point\n Tap to latlng: ");
            }),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            //tileBuilder: tileBuilder,
          ),
          if (data.isNotEmpty)
            HeatMapLayer(
              heatMapDataSource: InMemoryHeatMapDataSource(data: data),
              heatMapOptions: HeatMapOptions(radius: 60, layerOpacity: 0.7),
            ),
/*
            PolylineLayer(
              polylines: [
                for (int i = 0; i < grid.grid.length; i++)
                  Polyline(points: grid.getGridRow(i)),
                for (int i = 0; i < grid.grid.length; i++)
                  Polyline(points: grid.getGridColumn(i)),
              ],
            ),
*/
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
