import 'package:flutter/material.dart';
import '../interpreters/brainfuck.dart';
import '../interpreters/befunge.dart';
import '../interpreters/whitespace.dart';
import '../interpreters/lolcode.dart';
import '../interpreters/piet.dart';

class EditorScreen extends StatefulWidget {
  final String language;

  const EditorScreen({super.key, required this.language});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final codeController = TextEditingController();
  String output = "";

  void runCode() {
    final code = codeController.text;

    try {
      switch (widget.language) {
        case 'Brainfuck':
          output = BrainfuckInterpreter().run(code);
          break;
        case 'Befunge':
          output = BefungeInterpreter().run(code);
          break;
        case 'Whitespace':
          output = WhitespaceInterpreter().run(code);
          break;
        case 'LOLCODE':
          output = LolcodeInterpreter().run(code);
          break;
        case 'Piet':
          output = PietInterpreter().run(code); // Text output only
          break;
        default:
          output = "Interpreter not found.";
      }
    } catch (e) {
      output = "Error: $e";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.language),
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: codeController,
              maxLines: null,
              expands: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Write your ${0} code here...",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: runCode,
            child: const Text("Run"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                output,
                style:
                    const TextStyle(color: Colors.greenAccent, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
