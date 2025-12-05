class BefungeInterpreter {
  String run(String code) {
    final grid = code.split('\n').map((e) => e.split('')).toList();
    int x = 0, y = 0;
    int dx = 1, dy = 0;
    List<int> stack = [];
    String output = "";
    bool stringMode = false;

    while (true) {
      final cell = grid[y][x];

      if (stringMode) {
        if (cell == '"') {
          stringMode = false;
        } else {
          stack.add(cell.codeUnitAt(0));
        }
      } else {
        switch (cell) {
          case '>':
            dx = 1;
            dy = 0;
            break;
          case '<':
            dx = -1;
            dy = 0;
            break;
          case '^':
            dx = 0;
            dy = -1;
            break;
          case 'v':
            dx = 0;
            dy = 1;
            break;
          case '"':
            stringMode = true;
            break;
          case '.':
            output += stack.removeLast().toString();
            break;
          case '@':
            return output;
        }
      }

      x = (x + dx) % grid[0].length;
      y = (y + dy) % grid.length;
    }
  }
}
