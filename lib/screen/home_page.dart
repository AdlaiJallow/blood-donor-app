import 'package:blood_donor_app/screen/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home_screen';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        'Looking for donor',
        style: TextStyle(fontSize: 24),
      ),
    ),
    // Center(
    //   child: Text(
    //     'Profile',
    //     style: TextStyle(fontSize: 24),
    //   ),
    // ),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red.shade600,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search_rounded),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person_rounded),
                label: "Profile")
          ],
          currentIndex: _selectedIndex,
          elevation: 8.0,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
