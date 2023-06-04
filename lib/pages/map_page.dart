import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController _dataPicked = TextEditingController();
  final DateRangePickerController _datePickerController =
      DateRangePickerController();

  double lat = -29.692830906329835, long = -53.80942938166916;
  LatLng point = LatLng(-29.692830906329835, -53.80942938166916);
  List<LatLng> listaPoints = [
    LatLng(-29.692830906329835, -53.80942938166916),
  ];

  @override
  void initState() {
    _dataPicked.text = DateFormat("dd/MM/yy").format(DateTime.now());
    for (int i = 0; i < 5; i++) {
      lat += 0.0001;
      long += 0.001;
      listaPoints.add(LatLng(lat, long));
    }
    _incrementMovimento();
    super.initState();
  }

  void _incrementMovimento() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        lat += 0.0001;
        long += 0.001;
        listaPoints[5] = LatLng(lat, long);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final markers = listaPoints.map((latlng) {
      return Marker(
        width: 80,
        height: 80,
        point: latlng,
        builder: (ctx) => const Icon(
          Icons.location_on,
          color: Colors.red,
          size: 30,
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: Stack(alignment: Alignment.topCenter, children: [
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(-29.692830906329835, -53.80942938166916),
              zoom: 14.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              /*
                MarkerLayer(
                  markers: markers,
                ),
                */
              PolylineLayer(
                polylines: [
                  Polyline(
                      points: listaPoints, color: Colors.blue, strokeWidth: 5)
                ],
              )
            ],
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    controller: _dataPicked,
                    readOnly: true,
                    onTap: () {
                      getDateRange(context);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 249, 249),
                      labelText: "Data:",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(221, 29, 29, 29), fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(221, 22, 22, 22),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ]),
    );
  }

  void getDateRange(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.5,
                child: SfDateRangePicker(
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.range,
                    showActionButtons: true,
                    showTodayButton: true,
                    controller: _datePickerController,
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    onSubmit: (Object? value) {
                      DateTime? startDate =
                          _datePickerController.selectedRange?.startDate;
                      DateTime? endDate =
                          _datePickerController.selectedRange?.endDate;
                      String startDateText =
                          DateFormat("dd/MM/yy").format(startDate!);
                      String endDateText =
                          DateFormat("dd/MM/yy").format(endDate!);
                      _dataPicked.text = "De $startDateText até $endDateText";
                      Navigator.pop(context);
                    })),
          );
        });
  }
}
