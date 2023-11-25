// custom_navigation_bar.dart

import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Color indicatorColor;
  final List<NavigationDestination> destinations;

  const NavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.indicatorColor,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    // Your implementation for the NavigationBar widget
  }
}

class NavigationDestination {
  const NavigationDestination({
    required this.selectedIcon,
    required this.icon,
    required this.label,
  });

  final Widget selectedIcon;
  final Widget icon;
  final String label;
}
