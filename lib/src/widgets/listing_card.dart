import 'package:flutter/material.dart';

import '../consts/colors.dart';

class ListingCard extends StatefulWidget {
  final String address;
  final String imageUrl;

  const ListingCard({
    super.key,
    required this.address,
    required this.imageUrl,
  });

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 240.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(milliseconds: 4500), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 120, // Center vertically
            left: (MediaQuery.sizeOf(context).width * 0.16) / 2,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: 48,
              decoration: BoxDecoration(
                color: tanColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
              ),
              child:  Center(
                child: Text( widget.address,
                  style: const TextStyle(color: darkGrayColor, fontSize: 16),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                bottom: 34,
                left: _animation.value + 50,
                child: Container(
                  width: 48,
                  height: 44,
                  decoration: BoxDecoration(
                    color: tanColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: darkGrayColor,
                    size: 12,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
