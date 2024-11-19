import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/src/consts/app_style.dart';

import '../consts/colors.dart';

class RealEstateMap extends StatefulWidget {
  const RealEstateMap({super.key});

  @override
  State<RealEstateMap> createState() => _RealEstateMapState();
}

class _RealEstateMapState extends State<RealEstateMap> {
  late GoogleMapController mapController;
  String searchQuery = '';
  String selectedView = 'price';
  bool showViewOptions = false;

  final List<PropertyListing> propertyListings = [
    PropertyListing(
      id: '1',
      location: 'Novocherkasskaya',
      price: '7.8 mn ₽',
      position: const LatLng(59.9343, 30.3351),
    ),
    PropertyListing(
      id: '2',
      location: 'Moskovskiy',
      price: '11 mn ₽',
      position: const LatLng(59.9315, 30.3240),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(59.9343, 30.3351),
              zoom: 12,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              _setMapStyle(controller);
            },
            markers: _createMarkers(),
          ),

          // Search Bar
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Saint Petersburg',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onChanged: (value) {
                        setState(() => searchQuery = value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.layers),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 96,

            right: 16,
            child: TextButton(
              onPressed: () {
                setState(() => showViewOptions = !showViewOptions);
              },
              child: Container(
                width: 190,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: darkGrayColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.menu_sharp, color: whiteColor),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'List of variants',
                      style: AppStyles.font16Medium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 104,
            left: 32,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _buildCircleButton(Icons.layers),
                        const SizedBox(height: 8),
                        _buildCircleButton(Icons.navigation),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          // View Options Panel
          if (showViewOptions)
            Positioned(
              bottom: 160,
              left: 32,
              child: Container(
                decoration: BoxDecoration(
                  color: tanColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildViewOption('Cosy areas', Icons.check_circle_outline),
                    _buildViewOption('Price', Icons.attach_money),
                    _buildViewOption('Infrastructure', Icons.location_city),
                    _buildViewOption('Without any layer', Icons.layers_clear),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildViewOption(String title, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() => selectedView = title.toLowerCase());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey[700]),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: darkGrayColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {},
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return propertyListings.map((listing) {
      return Marker(
        markerId: MarkerId(listing.id),
        position: listing.position,
        infoWindow: InfoWindow(
          title: listing.price,
          snippet: listing.location,
        ),
      );
    }).toSet();
  }

  Future<void> _setMapStyle(GoogleMapController controller) async {
    // Add custom map style JSON here for dark theme
    String style = '''
    [
      {
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#212121"
          }
        ]
      },
      // Add more style rules as needed
    ]
    ''';
    await controller.setMapStyle(style);
  }
}

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
