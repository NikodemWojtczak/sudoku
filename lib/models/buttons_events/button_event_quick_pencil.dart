import 'package:sudoku/models/buttons_events/button_events.dart';

class QuickPencilEvents extends ButtonEvents {
  late Map<int, List<int>> previousHints;

  @override
  void execute() {
    previousHints = sudokuController.sudokuBoard.getHints();
    sudokuController.sudokuBoard
        .setHints(sudokuController.sudokuBoard.fillHints());
  }

  @override
  void undo() {
    sudokuController.sudokuBoard.setHints(previousHints);
  }
}
