import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

class SudokuGamePgController extends GetxController {
  SudokuController sudokuController = Get.find();
  int highlighted = 100;
  int xHighlighted = 10;
  int yHighlighted = 10;
  int xHighlightedBox = 10;
  int yHighlightedBox = 10;
  int highlightedValue = 100;

  void resetHighlights() {
    highlighted = 100;
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
    highlighted = number;
    _calculateHighlight();
    update();
  }

  void onCLickNumber(int number) {
    highlighted = number;
    _calculateHighlight();
    update();
  }

  void setSudokuFieldValue(int value) {
    try {
      sudokuController.setValueSudokuBoard(highlighted, value);
    } catch (e) {
      print(e);
    }
    update();
  }

  void _calculateHighlight() {
    xHighlighted = highlighted % 9;
    yHighlighted = highlighted ~/ 9;

    xHighlightedBox = xHighlighted ~/ 3;
    yHighlightedBox = yHighlighted ~/ 3;

    highlightedValue = getSudokuFieldValue(highlighted);
  }

  void onCLickHint() {}

  void onCLickPencil() {}

  void onCLickSuperPencil() {}

  void onCLickUndo() {}

  void onCLickCheck() {}
}
