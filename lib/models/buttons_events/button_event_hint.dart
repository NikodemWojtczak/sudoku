import 'dart:math';

import 'package:sudoku/models/buttons_events/button_events.dart';
import 'package:sudoku/models/sudoku_board_model.dart';
import 'package:sudoku/services/sudoku_solvers/sudoku_backtracking.dart';
import 'package:sudoku/utils/my_strings.dart';
import 'package:sudoku/widgets/pop_up.dart';

class HintEvents extends ButtonEvents {
  late int index;
  late int newValue;
  int previousValue = 0;

  @override
  void execute() {
    SudokuBackTracking sudokuBackTracking = SudokuBackTracking();
    sudokuController.decreaseNumbersOfHints();
    if (!sudokuController.sudokuBoard.getBoard().contains(0)) {
      return;
    }
    SudokuBoard sudokuBoard = SudokuBoard();
    sudokuBoard
        .loadSudokuBoard(List.from(sudokuController.sudokuBoard.getBoard()));
    try {
      sudokuBackTracking.solveSudoku(sudokuBoard);
    } catch (e) {
      MyPopUp.basicPopUp("Warning", MyStrings.noSudokuSolition);

      throw Exception("Hint error");
    }
    for (int i = 0; i < 1000; i++) {
      int randomIndex = Random().nextInt(81);
      if (sudokuController.sudokuBoard.getFieldValue(randomIndex) == 0) {
        index = randomIndex;
        newValue = sudokuBoard.getFieldValue(randomIndex);
        sudokuController.sudokuBoard
            .setFieldValue(randomIndex, sudokuBoard.getFieldValue(randomIndex));
        return;
      }
    }
    for (var i = 0; i < 81; i++) {
      if (sudokuController.sudokuBoard.getFieldValue(i) == 0) {
        index = i;
        newValue = sudokuBoard.getFieldValue(i);
        sudokuController.sudokuBoard
            .setFieldValue(i, sudokuBoard.getFieldValue(i));
      }
    }
  }

  @override
  void undo() {
    sudokuController.sudokuBoard.setFieldValue(index, previousValue);
  }
}
