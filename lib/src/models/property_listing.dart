import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyListing {
  final String id;
  final String location;
  final String price;
  final LatLng position;

  PropertyListing({
    required this.id,
    required this.location,
    required this.price,
    required this.position,
  });
}
