import 'dart:developer';
import 'package:sudoku/models/sudoku_board_model.dart';
import 'package:sudoku/services/sudoku_solvers/sudoku_solver.dart';

class SudokuBackTracking extends SudokuSolver {
  @override
  SudokuBoard generateSudoku() {
    SudokuBoard sudokuBoard = SudokuBoard();
    sudokuBoard.loadSudokuBoard(List.generate(81, (index) => 0));

    _backtracking(sudokuBoard: sudokuBoard);
    return sudokuBoard;
  }

  bool _backtracking({int index = 0, required SudokuBoard sudokuBoard}) {
    if (sudokuBoard.getFieldValue(index) != 0) {
      if (index == 80) {
        return true;
      }
      return _backtracking(index: index + 1, sudokuBoard: sudokuBoard);
    }
    List<int> numbersToFill = List.generate(9, (index) => index + 1);
    numbersToFill.shuffle();

    for (var number in numbersToFill) {
      if (canBePlaced(index, number, sudokuBoard)) {
        sudokuBoard.setFieldValue(index, number);
        if (index == 80) {
          return true;
        }
        if (_backtracking(index: index + 1, sudokuBoard: sudokuBoard)) {
          return true;
        } else {
          sudokuBoard.setFieldValue(index, 0);
        }
      }
    }
    sudokuBoard.setFieldValue(index, 0);
    return false;
  }

  @override
  solveSudoku(SudokuBoard sudokuBoard) {
    if (!_backtracking(sudokuBoard: sudokuBoard)) {
      throw Exception("No sudoku solvings");
    }
  }
}
