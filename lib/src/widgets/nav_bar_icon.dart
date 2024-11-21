import 'package:flutter/material.dart';
import 'package:real_estate_app/src/consts/colors.dart';

class NavBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarIcon({
    super.key,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected
              ?  orangeColor
              :  blackRaisinColor,
          shape: BoxShape.circle,
        ),
        duration: const Duration(milliseconds: 200),
        child: Icon(
          icon,
          color: isSelected ? whiteColor : whiteColor,
          size: 24,
        ),
      ),
    );
  }
}

