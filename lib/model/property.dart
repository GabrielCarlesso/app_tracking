import 'package:latlong2/latlong.dart';

class Property {
  String name;
  List<LatLng> cercaVirtual = [];

  Property(this.name);

  void addPoint(LatLng point) {
    cercaVirtual.add(point);
  }

  void ordenarPoitns() {
    cercaVirtual.sort((a, b) => a.latitude.compareTo(b.latitude));
  }
}
