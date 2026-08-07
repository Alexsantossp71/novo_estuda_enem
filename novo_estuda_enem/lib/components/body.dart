import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novo_estuda_enem/components/progress_bar.dart';
import 'package:novo_estuda_enem/components/question_card.dart';
import 'package:novo_estuda_enem/constant.dart';
import 'package:novo_estuda_enem/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ProgressBar(),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Obx(() => Text.rich(
                    TextSpan(
                        text:
                            'Pergunta ${questionController.questionNumber.value}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: KSecondaryColor),
                        children: [
                          TextSpan(
                            text: " / ${questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: KSecondaryColor),
                          ),
                        ]),
                  )),
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Expanded(
                child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: questionController.updateTheQrNum,
                    controller: questionController.pageController,
                    itemCount: questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: questionController.questions[index]))), //
          ],
        ))
      ],
    );
  }
}
