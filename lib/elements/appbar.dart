import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _heightRatio = 0.1; // 10% of screen height
  final BuildContext context;
  final IconData drawerIcon;
  MyAppBar({
    Key? key,
    required this.context,
    this.drawerIcon = Icons.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainThemeColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          drawerIcon,
          size: 35,
          color: mainTextColor, // set the desired size of the icon here
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * _heightRatio);
}
