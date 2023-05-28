/*

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: Center(
          child: Container(
              padding: const EdgeInsets.only(top: 25),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    await MapUtils.openMap(
                        -29.693350757465154, -53.80449299121594);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        const Color.fromARGB(240, 124, 187, 0), // foreground
                    padding: const EdgeInsets.all(15),
                    elevation: 2,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  icon: const Icon(Icons.input, size: 18),
                  label: const Text("Map")))),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    final Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    Uri googleUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    }
  }
}
*/