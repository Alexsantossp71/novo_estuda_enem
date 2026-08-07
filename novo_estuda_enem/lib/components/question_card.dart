import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novo_estuda_enem/components/options.dart';
import 'package:novo_estuda_enem/constant.dart';
import 'package:novo_estuda_enem/controllers/question_controller.dart';
import 'package:novo_estuda_enem/models/questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            // "teste",
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: KBlackColor),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(
              question.options.length,
              (index) => Options(
                    index: index,
                    text: question.options[index],
                    press: () => controller.checkAns(question, index),
                  )),
          /*  Options(),
          Options(),
          Options(),
          Options(),*/
        ],
      ),
    );
  }
}
