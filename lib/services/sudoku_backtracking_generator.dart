class Sudoku_BackTrackingGenerator {
  List<int> sudokuBoard = [];

  List<int> generateSudoku() {
    sudokuBoard = List.generate(81, (index) => 0);

    _backtracking();
    return sudokuBoard;
  }

  bool _canBePlaced(int index, int value) {
    int x = index % 9;
    int y = index ~/ 9;
    int boxX = x ~/ 3;
    int boxY = y ~/ 3;
    int boxOffset = 27 * boxY + 3 * boxX;
    for (var i = 0; i < 9; i++) {
      int columnsValues = sudokuBoard[x + i * 9];
      int rowsValues = sudokuBoard[y * 9 + i];
      int boxsValues = sudokuBoard[boxOffset + i % 3 + 9 * (i ~/ 3)];
      if (columnsValues == value ||
          rowsValues == value ||
          boxsValues == value) {
        return false;
      }
    }
    return true;
  }

  bool _backtracking({int index = 0}) {
    List<int> numbersToFill = List.generate(9, (index) => index + 1);
    numbersToFill.shuffle();

    for (var number in numbersToFill) {
      if (_canBePlaced(index, number)) {
        sudokuBoard[index] = number;
        if (index == 80) {
          return true;
        }
        if (_backtracking(index: index + 1)) {
          return true;
        } else {
          sudokuBoard[index] = 0;
        }
      }
    }
    sudokuBoard[index] = 0;
    return false;
  }
}
