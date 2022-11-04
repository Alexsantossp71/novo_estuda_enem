import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novo_estuda_enem/Screens/quiz/quiz_screen.dart';
import 'package:novo_estuda_enem/Screens/welcome/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Estuda Enem ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
    );
  }
}
