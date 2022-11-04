import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novo_estuda_enem/components/body.dart';
import 'package:novo_estuda_enem/controllers/question_controller.dart';

class QuizzScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const QuizzScreen({key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: const Text('Pular'),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
