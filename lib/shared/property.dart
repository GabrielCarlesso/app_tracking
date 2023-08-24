import 'package:latlong2/latlong.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Property extends GetxController {
  String name;
  List<LatLng> cercaVirtual = [];

  Property(this.name);

  void addPoint(LatLng point) {
    cercaVirtual.add(point);
    cercaVirtual.sort((a, b) => a.latitude.compareTo(b.latitude));
    update();
  }
}
