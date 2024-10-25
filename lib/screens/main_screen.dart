import 'package:flutter/material.dart';
import 'package:task_application_2/calculator_getx/screens/calculator_screen.dart';
import 'package:task_application_2/calculator_provider/screens/CalculatorScreen.dart';
import 'package:task_application_2/camera_task/screens/camera_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens corresponding to the bottom navigation items
  static final List<Widget> _screens = <Widget>[
    const CalculatorScreenProvider(),
    CalculatorScreen(),
    const CameraScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, // Subtle shadow effect
              blurRadius: 10,
              offset: Offset(0, -2), // Shadow positioning
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), // Icon for Provider screen
                label: 'Provider',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.workspaces_outlined), // Icon for GetX screen
                label: 'GetX',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image_outlined), // Icon for Upload screen
                label: 'Upload',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
