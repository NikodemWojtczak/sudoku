abstract class SudokuSolver {
  List<int> sudokuBoard = [];

  List<int> generateSudoku();

  bool canBePlaced(int index, int value) {
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
}
