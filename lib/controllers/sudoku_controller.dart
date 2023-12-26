import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/models/sudoku_board_model.dart';

class SudokuController extends GetxController {
  late List<List<int>> sudokuBoardsHard;
  late List<List<int>> sudokuBoardsEasy;
  late List<List<int>> sudokuBoardsMedium;

  SudokuBoard sudokuBoard = SudokuBoard();

  late int _level;
  late Levels _difficulty;

  Map<int, List<int>> hints = {};

  bool isGameOn = false;

  @override
  void onInit() {
    super.onInit();
    resetHintValues();
  }

  void resetHintValues() {
    hints = {};
    for (var i = 0; i < 81; i++) {
      hints[i] = [];
    }
  }

  void setValueSudokuBoard(int index, int value) {
    sudokuBoard.sudokuBoard[index] = value;
  }

  void loadLevel(int level, Levels difficulty) {
    resetHintValues();
    _level = level;
    _difficulty = difficulty;
    switch (_difficulty) {
      case Levels.easy:
        sudokuBoard.sudokuBoard = List.from(sudokuBoardsEasy[_level]);
        break;
      case Levels.medium:
        sudokuBoard.sudokuBoard = List.from(sudokuBoardsMedium[_level]);
        break;
      case Levels.hard:
        sudokuBoard.sudokuBoard = List.from(sudokuBoardsHard[_level]);
        break;
    }
    isGameOn = true;
  }

  void fillHints() {
    resetHintValues();
    for (var i = 0; i < sudokuBoard.sudokuBoard.length; i++) {
      int value = sudokuBoard.sudokuBoard[i];

      if (value != 0) {
        continue;
      }

      List<int> newHints = List.generate(9, (index) => index++);

      int x = i % 9;
      int y = i ~/ 9;
      int boxX = x ~/ 3;
      int boxY = y ~/ 3;
      int boxOffset = 27 * boxY + 3 * boxX;

      for (var i = 0; i < 9; i++) {
        int columnsValues = sudokuBoard.sudokuBoard[x + i * 9];
        int rowsValues = sudokuBoard.sudokuBoard[y * 9 + i];
        int boxsValues =
            sudokuBoard.sudokuBoard[boxOffset + i % 3 + 9 * (i ~/ 3)];
        newHints.remove(columnsValues);
        newHints.remove(rowsValues);
        newHints.remove(boxsValues);
      }

      hints[i] = newHints;
    }
  }

  void removeHints(int index, int value) {
    int x = index % 9;
    int y = index ~/ 9;
    int boxX = x ~/ 3;
    int boxY = y ~/ 3;
    int boxOffset = 27 * boxY + 3 * boxX;

    for (var i = 0; i < 9; i++) {
      hints[x + i * 9]?.remove(value);
      hints[y * 9 + i]?.remove(value);
      hints[boxOffset + i % 3 + 9 * (i ~/ 3)]?.remove(value);
    }
  }
}
