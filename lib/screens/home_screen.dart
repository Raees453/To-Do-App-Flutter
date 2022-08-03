import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/completed_projects_screen_widget.dart';
import 'package:to_do_app/widgets/home_screen_widget.dart';
import 'package:to_do_app/widgets/profile_screen_widget.dart';
import 'package:to_do_app/widgets/projects_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _screens;
  int _selectedScreen = 0;

  @override
  void initState() {
    _screens = const [
      HomeScreenWidget(),
      ProjectScreenWidget(),
      CompletedProjectsScreenWidget(),
      ProfileScreenWidget(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        onTap: (int index) => setState(() {
          _selectedScreen = index;
        }),
        currentIndex: _selectedScreen,
      ),
      body: _screens.elementAt(_selectedScreen),
    );
  }
}
