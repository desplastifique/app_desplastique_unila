import 'package:google_maps_flutter/google_maps_flutter.dart';

class CollectLocation {
  LatLng position;
  String info;

  CollectLocation(this.info, this.position);
}

List<CollectLocation> locations = [
  CollectLocation(
      "Reciclafoz Reciclagem", LatLng(-25.504341075397775, -54.59064289566422)),
  CollectLocation(
      "Recicladora Nª Srª Aparecida", LatLng(-25.49563805936276, -54.52464466682039)),
  CollectLocation(
      "RS Reciclagem", LatLng(-25.542770868982565, -54.590700334118345)),
  CollectLocation(
      "Recicladora Foz do Iguaçu", LatLng(-25.500338142086147, -54.53142820234391)),
];

List<CollectLocation> getCollectLocations() {
  return locations;
}

