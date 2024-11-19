import 'package:flutter/material.dart';

import 'nav_bar_icon.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavBarIcon(
              icon: Icons.search,
              isSelected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavBarIcon(
              icon: Icons.chat_bubble_outline,
              isSelected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            // Center home button
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _selectedIndex == 2
                      ? const Color(0xFFF5A623)
                      : const Color(0xFFF5A623).withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            NavBarIcon(
              icon: Icons.favorite_border,
              isSelected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
            NavBarIcon(
              icon: Icons.person_outline,
              isSelected: _selectedIndex == 4,
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
