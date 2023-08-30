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

  LatLng getPropertyCenter() {
    double centerX = 0.0;
    double centerY = 0.0;

    for (LatLng vertex in cercaVirtual) {
      centerX += vertex.latitude;
      centerY += vertex.longitude;
    }

    centerX /= cercaVirtual.length;
    centerY /= cercaVirtual.length;

    return LatLng(centerX, centerY);
  }
}
