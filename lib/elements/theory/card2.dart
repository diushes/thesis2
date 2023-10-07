import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color cardColor; // New property for card color

  const Card2({
    required this.title,
    required this.onTap,
    this.cardColor = Colors.white, // Default card color is white
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: cardColor, // Set the color property of the Card widget
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontFamily: "Raleway-Regular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
