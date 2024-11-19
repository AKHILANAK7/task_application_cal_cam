import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_application_2/calculator_getx/screens/calculator_screen.dart';
import 'package:task_application_2/calculator_provider/screens/CalculatorScreen.dart';
import 'package:task_application_2/camera_task/screens/camera_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Application',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreenProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectTab(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notifies widgets about state changes
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _screens = <Widget>[
    const CalculatorScreenProvider(),
    CalculatorScreen(),
    const CameraScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainScreenProvider = Provider.of<MainScreenProvider>(context);

    return Scaffold(
      body: _screens[mainScreenProvider.selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
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
                icon: Icon(Icons.home_outlined),
                label: 'Provider',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.workspaces_outlined),
                label: 'GetX',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image_outlined),
                label: 'Upload',
              ),
            ],
            currentIndex: mainScreenProvider.selectedIndex,
            onTap: mainScreenProvider.selectTab,
          ),
        ),
      ),
    );
  }
}
