import 'package:flutter/material.dart';

class ListingCard extends StatelessWidget {
  final String address;
  final String imageUrl;

  const ListingCard({super.key,
    required this.address,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     address,
          //     style: TextStyle(
          //       fontSize: 18.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}