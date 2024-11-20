import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/property_listing.dart';
import '../widgets/custom_map_marker.dart';

final markersProvider = FutureProvider<Set<Marker>>((ref) async {
  return {
    for (var listing in propertyListings)
      Marker(
        markerId: MarkerId(listing.id),
        position: listing.position,
        icon: await CustomMapMarker.createCustomMarker(listing.price),
        infoWindow: InfoWindow(
          title: listing.location,
          snippet: listing.price
        )
      )
  };
});



final List<PropertyListing> propertyListings = [
  PropertyListing(
    id: '1',
    location: 'Novocherkasskaya',
    price: '7,8 mn ₽',
    position: const LatLng(59.9343, 30.3551),
  ),
  PropertyListing(
    id: '2',
    location: 'Moskovskiy',
    price: '11 mn ₽',
    position: const LatLng(59.9305, 30.3100),
  ),
  PropertyListing(
    id: '3',
    location: 'Primorskaya',
    price: '9,5 mn ₽',
    position: const LatLng(59.9690, 30.3480),
  ),
  PropertyListing(
    id: '4',
    location: 'Komendantskiy',
    price: '8,2 mn ₽',
    position: const LatLng(59.9200, 30.3700),
  ),
  PropertyListing(
    id: '5',
    location: 'Parnas',
    price: '10,3 mn ₽',
    position: const LatLng(59.9480, 30.3200),
  ),
  PropertyListing(
    id: '6',
    location: 'Prospekt Prosveshcheniya',
    price: '9,1 mn ₽',
    position: const LatLng(59.9390, 30.3050),
  ),
];