import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Theory',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Tests',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Forum',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0, // set the height here
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          backgroundColor: secondaryThemeColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: iconColor,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/topics");
                },
                child: ImageIcon(AssetImage('assets/icons/theory.png')),
              ),
              label: 'Theory',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/quizzes");
                },
                child: ImageIcon(AssetImage('assets/icons/quizzes.png')),
              ),
              label: 'Tests',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {},
                child: ImageIcon(AssetImage('assets/icons/forum.png')),
              ),
              label: 'Forum',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
