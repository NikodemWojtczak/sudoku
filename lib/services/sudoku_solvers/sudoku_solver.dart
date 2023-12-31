import 'package:sudoku/models/sudoku_board_model.dart';

abstract class SudokuSolver {
  List<int> generateSudoku();

  solveSudoku(SudokuBoard sudokuBoard);

  bool canBePlaced(int index, int value, SudokuBoard sudokuBoard) {
    int x = index % 9;
    int y = index ~/ 9;
    int boxX = x ~/ 3;
    int boxY = y ~/ 3;
    int boxOffset = 27 * boxY + 3 * boxX;
    for (var i = 0; i < 9; i++) {
      int columnsValues = sudokuBoard.getFieldValue(x + i * 9);
      int rowsValues = sudokuBoard.getFieldValue(y * 9 + i);
      int boxsValues =
          sudokuBoard.getFieldValue(boxOffset + i % 3 + 9 * (i ~/ 3));
      if (columnsValues == value ||
          rowsValues == value ||
          boxsValues == value) {
        return false;
      }
    }
    return true;
  }
}
