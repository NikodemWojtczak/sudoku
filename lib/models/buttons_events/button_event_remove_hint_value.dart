import 'package:sudoku/models/buttons_events/button_events.dart';

class RemoveHintValueEvents extends ButtonEvents {
  int index;
  int valueToRemove;

  RemoveHintValueEvents(this.index, this.valueToRemove);

  @override
  void execute() {
    sudokuController.sudokuBoard.hints[index]?.remove(valueToRemove);
  }

  @override
  void undo() {
    sudokuController.sudokuBoard.hints[index]?.add(valueToRemove);
  }
}
