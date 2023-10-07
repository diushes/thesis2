import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
    required this.isAnswered,
    required this.isCorrect,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;
  final bool isAnswered;
  final bool isCorrect;

  Color getOptionColor(BuildContext context) {
    if (!isAnswered) {
      return Colors.grey;
    } else if (isAnswered && isCorrect == true) {
      // Correctly answered option
      return Colors.green;
    } else if (isAnswered && isCorrect == false) {
      // Incorrectly answered option
      return Colors.red;
    } else {
      // Unanswered option
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final optionColor = getOptionColor(context);
    return InkWell(
      onTap: press,
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: secondaryThemeColor,
            border: Border.all(color: optionColor), // Set border color
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${index + 1}. $text",
                  style: const TextStyle(
                    color: mainTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
