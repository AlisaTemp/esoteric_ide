import 'package:flutter/material.dart';
import 'editor_screen.dart';

class LanguageSelectorScreen extends StatelessWidget {
  const LanguageSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      'Brainfuck',
      'Befunge',
      'Whitespace',
      'LOLCODE',
      'Piet',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Esoteric IDE")),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              languages[index],
              style: const TextStyle(color: Colors.greenAccent),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      EditorScreen(language: languages[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
