import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:novo_estuda_enem/Screens/score/score_screen.dart';
import 'package:novo_estuda_enem/Screens/welcome/welcome_screen.dart';
import 'package:novo_estuda_enem/models/questions.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? _animationController;
  Animation? _animation;

  Animation? get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns = 0;
  int get correctAns => this._correctAns;

  int _selectedAns = 0;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!)
      ..addListener(() {
        update();
      });
    // começa a animação
    _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController!.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // quando pressiona quelquer opção
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    _animationController?.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      //reseta a contagem de tempo
      _animationController!.reset();
//recomeça a contagem do tempo para resposta
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void Recomecar() {
    _isAnswered = false;
    _correctAns = 0;
    _selectedAns = 0;
    _numOfCorrectAns = 0;
    _questionNumber = 1.obs;
    _animationController!.reset();
    Get.to(WelcomeScreen());
  }

  void updateTheQrNum(int index) {
    _questionNumber.value = index + 1;
  }
}
