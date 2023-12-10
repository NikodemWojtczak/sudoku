import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

class SudokuGamePgController extends GetxController {
  SudokuController sudokuController = Get.find();

  int highlightedField = 100;
  int xHighlighted = 10;
  int yHighlighted = 10;
  int xHighlightedBox = 10;
  int yHighlightedBox = 10;
  int highlightedValue = 100;

  bool isPencilOn = false;

  void resetHighlights() {
    highlightedField = 100;
    xHighlighted = 10;
    yHighlighted = 10;
    xHighlightedBox = 10;
    yHighlightedBox = 10;
    highlightedValue = 100;
  }

  int getSudokuFieldValue(int number) {
    return sudokuController.sudokuBoard[number];
  }

  void onCLickField(int number) {
    highlightedField = number;
    _calculateHighlight();
    update();
  }

  void onCLickNumber(int number) {
    if (isPencilOn) {
      sudokuController.hints[highlightedField]?.add(number);
    } else {
      setSudokuFieldValue(number);
    }

    update();
  }

  void setSudokuFieldValue(int value) {
    sudokuController.setValueSudokuBoard(highlightedField, value);
  }

  void _calculateHighlight() {
    xHighlighted = highlightedField % 9;
    yHighlighted = highlightedField ~/ 9;

    xHighlightedBox = xHighlighted ~/ 3;
    yHighlightedBox = yHighlighted ~/ 3;

    highlightedValue = getSudokuFieldValue(highlightedField);
  }

  void onCLickHint() {}

  void onCLickPencil() {
    isPencilOn = !isPencilOn;
    update();
  }

  void onCLickSuperPencil() {}

  void onCLickUndo() {}

  void onCLickCheck() {}
}
