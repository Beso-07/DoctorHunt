import 'package:doctorhunt/feature/common/bottom_bar/presentation/widgets/admin_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';


class AdminBottomBar extends StatefulWidget {
  const AdminBottomBar({super.key});

  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      Center(
        child: Text(
          'Doctors',
          style: TextStyle(fontSize: 24),
        ),
      ),
      Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 24),
        ),
      ),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: AdminBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}