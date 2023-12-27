import 'package:sudoku/models/buttons_events/button_events.dart';

class SetFieldValueEvents extends ButtonEvents {
  int index;
  int newValue;
  late int previousValue;

  SetFieldValueEvents(this.index, this.newValue) {
    previousValue = sudokuController.sudokuBoard.getFieldValue(index);
  }

  @override
  void execute() {
    sudokuController.sudokuBoard.setFieldValue(index, newValue);
  }

  @override
  void undo() {
    sudokuController.sudokuBoard.setFieldValue(index, previousValue);
  }
}
