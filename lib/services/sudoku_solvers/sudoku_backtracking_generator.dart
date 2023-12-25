import 'package:sudoku/services/sudoku_solvers/sudoku_solver.dart';

class SudokuBackTrackingGenerator extends SudokuSolver {
  @override
  List<int> generateSudoku() {
    sudokuBoard = List.generate(81, (index) => 0);

    _backtracking();
    return sudokuBoard;
  }

  bool _backtracking({int index = 0}) {
    List<int> numbersToFill = List.generate(9, (index) => index + 1);
    numbersToFill.shuffle();

    for (var number in numbersToFill) {
      if (canBePlaced(index, number)) {
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
