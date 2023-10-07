import 'package:flutter/material.dart';
import 'package:thesis2/config/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _heightRatio = 0.1; // 10% of screen height
  final BuildContext context;
  final bool hasBackButton;

  MyAppBar({
    Key? key,
    required this.context,
    this.hasBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainThemeColor,
      elevation: 0,
      leading: hasBackButton
          ? SizedBox(
              width: 80,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                  color: mainTextColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * _heightRatio);
}
