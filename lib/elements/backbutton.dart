import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class MyBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const MyBackButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.0, // set the desired width here
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: mainTextColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
