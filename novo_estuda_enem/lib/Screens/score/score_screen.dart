import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novo_estuda_enem/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:novo_estuda_enem/constant.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                "Resultado",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: KSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${qnController.numOfCorrectAns * 10} / ${qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: KSecondaryColor),
              ),
              const Spacer(
                flex: 3,
              ),
              InkWell(
                onTap: qnController.Recomecar,
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                  decoration: const BoxDecoration(
                    gradient: KprimaryGradient,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Recomeçar",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
