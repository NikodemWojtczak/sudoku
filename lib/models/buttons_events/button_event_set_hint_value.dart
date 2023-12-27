import 'package:sudoku/models/buttons_events/button_events.dart';

class SetHintValueEvents extends ButtonEvents {
  int index;
  int valueToSet;

  SetHintValueEvents(this.index, this.valueToSet);

  @override
  void execute() {
    sudokuController.sudokuBoard.hints[index]?.add(valueToSet);
  }

  @override
  void undo() {
    sudokuController.sudokuBoard.hints[index]?.remove(valueToSet);
  }
}
