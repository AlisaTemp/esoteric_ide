import 'package:flutter/material.dart';
import 'screens/language_selector.dart';

void main() {
  runApp(const EsotericIDE());
}

class EsotericIDE extends StatelessWidget {
  const EsotericIDE({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esoteric IDE',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.greenAccent),
        ),
        primaryColor: Colors.greenAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111111),
        ),
      ),
      home: const LanguageSelectorScreen(),
    );
  }
}
