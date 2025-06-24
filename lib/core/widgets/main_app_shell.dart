// lib/core/widgets/main_app_shell.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';

class MainAppShell extends StatefulWidget {
  final Widget child;
  const MainAppShell({super.key, required this.child});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  // Logic is updated to reflect the new tab order
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/dashboard')) {
      return 0;
    }
    // "My Apps" is now at index 1
    if (location.startsWith('/applications')) {
      return 1;
    }
    // "Feed" is now at index 2
    if (location.startsWith('/feed')) {
      return 2;
    }
    // "Profile" is now at index 3
    if (location.startsWith('/profile')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        // Index 1 now goes to '/applications'
        context.go('/applications');
        break;
      case 2:
        // Index 2 now goes to '/feed'
        context.go('/feed');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textTertiary,
        elevation: 1,
        // --- UPDATED NAVIGATION ITEMS ---
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_2),
            activeIcon: Icon(Iconsax.home_1),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.document_text),
            activeIcon: Icon(Iconsax.book),
            label: 'My Apps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.cup), // Using a 'cup' icon for a Feed/Success placeholder
            activeIcon: Icon(Iconsax.cup),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            activeIcon: Icon(Iconsax.user_copy),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}