import 'package:flutter/material.dart';
import 'package:teenai_ui_test/screen/hire_page.dart';
import 'package:teenai_ui_test/screen/post_page.dart';
import 'package:teenai_ui_test/screen/profile_page.dart';

import 'home_page.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _selectedIndex = 0;
  int id;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pageOptions = <Widget>[
    HomePage(),
    HirePage(),
    PostPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height *0.09,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv, size: 20),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_rounded, size: 20),
              label: 'จ้างงาน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded, size: 20),
              label: 'โพสต์งาน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 20),
              label: 'โปรไฟล์',
              
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(fontSize: 12),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
