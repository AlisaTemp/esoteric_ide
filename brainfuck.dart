class BrainfuckInterpreter {
  String run(String code) {
    List<int> tape = List.filled(30000, 0);
    int ptr = 0;
    int pc = 0;
    List<String> output = [];
    List<int> stack = [];

    while (pc < code.length) {
      switch (code[pc]) {
        case '>':
          ptr++;
          break;
        case '<':
          ptr--;
          break;
        case '+':
          tape[ptr]++;
          break;
        case '-':
          tape[ptr]--;
          break;
        case '.':
          output.add(String.fromCharCode(tape[ptr]));
          break;
        case ',':
          break;
        case '[':
          if (tape[ptr] == 0) {
            int depth = 1;
            while (depth > 0) {
              pc++;
              if (code[pc] == '[') depth++;
              if (code[pc] == ']') depth--;
            }
          } else {
            stack.add(pc);
          }
          break;
        case ']':
          if (tape[ptr] != 0) {
            pc = stack.last;
          } else {
            stack.removeLast();
          }
          break;
      }
      pc++;
    }

    return output.join();
  }
}
