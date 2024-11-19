import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/home_page.dart';
import '../pages/real_estate_map.dart';
import '../providers/navigation_provider.dart';
import 'nav_bar_icon.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  static const List<Widget> _pages = <Widget>[

    RealEstateMap(),
    Icon(
      Icons.call,
      size: 150,
    ),
    Home(),
    Icon(
      Icons.chat,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: _pages.elementAt(ref.watch(selectedIndex)),
        bottomNavigationBar: const BottomNavigation());
  }
}

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  void _onItemTapped(int index) {
    ref.read(selectedIndex.notifier).state = index;
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
              isSelected: ref.watch(selectedIndex) == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavBarIcon(
              icon: Icons.chat_bubble_outline,
              isSelected: ref.watch(selectedIndex) == 1,
              onTap: () => _onItemTapped(1),
            ),
            // Center home button
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: ref.watch(selectedIndex) == 2
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
              isSelected: ref.watch(selectedIndex) == 3,
              onTap: () => _onItemTapped(3),
            ),
            NavBarIcon(
              icon: Icons.person_outline,
              isSelected: ref.watch(selectedIndex) == 4,
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
