import 'package:doctorhunt/feature/bottom_bar/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:doctorhunt/feature/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      Center(
        child: Text(
          'Favorite Doctors',
          style: TextStyle(fontSize: 24),
        ),
      ),
      Center(
        child: Text(
          ' Appointments',
          style: TextStyle(fontSize: 24),
        ),
      ),
      Center(
        child: Text(
          'Chats',
          style: TextStyle(fontSize: 24),
        ),
      ),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
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