import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../../core/theme/app_colors.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();





}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('Category'))),
    const Scaffold(body: Center(child: Text('Message'))),
    const Scaffold(body: Center(child: Text('Cart'))),
    const Scaffold(body: Center(child: Text('Private'))),
