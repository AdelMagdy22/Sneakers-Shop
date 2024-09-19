import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: GNav(
        color: Theme.of(context).colorScheme.primary,
        activeColor: Theme.of(context).colorScheme.secondary,
        tabActiveBorder: Border.all(
          color: Colors.white,
        ),
        tabBorderRadius: 16,
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.home,
            iconColor: Theme.of(context).colorScheme.primary,
            text: 'Shop',
            textColor: Theme.of(context).colorScheme.primary,
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            iconColor: Theme.of(context).colorScheme.primary,
            text: 'Cart',
            textColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
