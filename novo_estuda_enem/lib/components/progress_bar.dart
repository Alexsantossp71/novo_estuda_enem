import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:novo_estuda_enem/constant.dart';
import 'package:novo_estuda_enem/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            print(controller.animation!.value);
            return Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                          width: constraints.maxWidth *
                              controller.animation!.value,
                          decoration: BoxDecoration(
                            gradient: KprimaryGradient,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${(controller.animation!.value * 60).round()} sec'),
                      WebsafeSvg.asset("assets/icons/clock.svg")
                    ],
                  ),
                ))
              ],
            );
          }),
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F4768),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
