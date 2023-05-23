import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';

class MyBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  const MyBottomNavBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/quizzes');
          break;
        case 2:
          Navigator.pushNamed(context, '/quiz');
          break;
        case 3:
          Navigator.pushNamed(context, '/settings');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0, // set the height here
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          backgroundColor: secondaryThemeColor,
          selectedItemColor: mainTextColor,
          unselectedItemColor: iconColor,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  _onItemTapped(0);
                },
                child: ImageIcon(AssetImage('assets/icons/theory.png')),
              ),
              label: '', // Empty label
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  _onItemTapped(1);
                },
                child: ImageIcon(AssetImage('assets/icons/quizzes.png')),
              ),
              label: '', // Empty label
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  _onItemTapped(2);
                },
                child: ImageIcon(AssetImage('assets/icons/forum.png')),
              ),
              label: '', // Empty label
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  _onItemTapped(3);
                },
                child: ImageIcon(AssetImage('assets/icons/setting.png')),
              ),
              label: '', // Empty label
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
