import 'package:sudoku/models/buttons_events/button_events.dart';
import 'package:sudoku/services/sudoku_solvers/sudoku_backtracking.dart';
import 'package:sudoku/widgets/pop_up.dart';

class HintEvents extends ButtonEvents {
  @override
  void execute() {
    SudokuBackTracking sudokuBackTracking = SudokuBackTracking();
    sudokuController.decreaseNumbersOfHints();
    try {
      sudokuBackTracking.solveSudoku(sudokuController.sudokuBoard);
    } catch (e) {
      MyPopUp.basicPopUp("title", "content");
    }
  }

  @override
  void undo() {}
}
