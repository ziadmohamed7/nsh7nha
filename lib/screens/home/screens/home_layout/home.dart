// home_view.dart

import 'package:flutter/material.dart';
import 'package:nsh7nha/route/route_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('home page '),
      ),
      // bottomNavigationBar: ,
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent, // Background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, -2), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0), // Padding from bottom
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                // Navigate to Home
              },
            ),
            BottomNavItem(
              icon: Icons.shopping_cart,
              label: 'Cart',
              onTap: () {
                Navigator.pushReplacementNamed(context, cartScreenRoute);
              },
            ),
            BottomNavItem(
              icon: Icons.sports_esports, // Gamepad icon
              label: 'Games',
              onTap: () {
                // Navigate to Games
              },
            ),
            BottomNavItem(
              icon: Icons.person, // Profile icon
              label: 'Profile',
              onTap: () {
                // Navigate to Profile
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 30), // Icon color
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
