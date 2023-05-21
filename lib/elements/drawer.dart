import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: secondaryThemeColor, // set desired background color here
        child: Column(
          children: [
            const SizedBox(
              height: 250,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: mainThemeColor,
                ),
                accountName: Text(
                  'John Doe',
                  style: TextStyle(
                    color: mainTextColor,
                  ),
                ),
                accountEmail: Text(
                  'diushes1712@gmail.com',
                  style: TextStyle(
                    color: secondaryTextColor,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    color: mainTextColor,
                  ),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help',
                    style: TextStyle(
                      color: mainTextColor,
                    )),
                onTap: () {},
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: mainTextColor,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
