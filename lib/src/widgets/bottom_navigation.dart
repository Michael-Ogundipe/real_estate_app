import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../consts/colors.dart';
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
    Center(
      child: Icon(Icons.chat, size: 150),
    ),
    Home(),
    Center(
      child: Icon(Icons.favorite_border, size: 150),
    ),
    Center(
      child: Icon(Icons.person, size: 150),
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
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        decoration: BoxDecoration(
          color: darkGrayColor,
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
              icon: Icons.chat,
              isSelected: ref.watch(selectedIndex) == 1,
              onTap: () => _onItemTapped(1),
            ),
            NavBarIcon(
              icon: Icons.home,
              isSelected: ref.watch(selectedIndex) == 2,
              onTap: () => _onItemTapped(2),
            ),
            NavBarIcon(
              icon: Icons.favorite,
              isSelected: ref.watch(selectedIndex) == 3,
              onTap: () => _onItemTapped(3),
            ),
            NavBarIcon(
              icon: Icons.person,
              isSelected: ref.watch(selectedIndex) == 4,
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
