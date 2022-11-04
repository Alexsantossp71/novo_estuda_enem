import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novo_estuda_enem/constant.dart';
import 'package:novo_estuda_enem/controllers/question_controller.dart';

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRigthColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return KGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return KRedColor;
              }
            }
            return KGrayColor;
          }

          IconData getTheRigthIcon() {
            return getTheRigthColor() == KRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(
                  color: getTheRigthColor(),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${index + 1} $text ",
                      style: TextStyle(color: getTheRigthColor())),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        color: getTheRigthColor() == KGrayColor
                            ? Colors.transparent
                            : getTheRigthColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRigthColor())),
                    child: Icon(
                      getTheRigthIcon(),
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
