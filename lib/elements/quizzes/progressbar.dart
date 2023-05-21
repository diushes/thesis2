import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thesis2/controllers/question_controller.dart';

import '../../config/app_colors.dart';
import '../../config/constants.dart';

class progressBar extends StatelessWidget {
  const progressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                          width:
                              constraints.maxWidth * controller.animation.value,
                          decoration: BoxDecoration(
                            gradient: primaryGradient,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )),
                Positioned.fill(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                      )
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
