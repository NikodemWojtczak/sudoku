class SudokuBoard {
  List<int> sudokuBoard = [];

  bool validate() {
    if (sudokuBoard.contains(0)) {
      return false;
    }

    for (var i = 0; i < sudokuBoard.length; i++) {
      int value = sudokuBoard[i];

      int x = i % 9;
      int y = i ~/ 9;
      int boxX = x ~/ 3;
      int boxY = y ~/ 3;
      int boxOffset = 27 * boxY + 3 * boxX;

      sudokuBoard[i] = 0;
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
      sudokuBoard[i] = value;
    }

    return true;
  }
}
