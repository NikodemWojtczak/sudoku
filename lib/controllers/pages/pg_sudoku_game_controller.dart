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

  int getSudokuFieldValue(int number) {
    return sudokuController.sudokuBoard[number];
  }

  void onCLickField(number) {
    highlighted = number;
    _calculateHighlight();
    update();
  }

  void _calculateHighlight() {
    xHighlighted = highlighted % 9;
    yHighlighted = highlighted ~/ 9;

    xHighlightedBox = xHighlighted ~/ 3;
    yHighlightedBox = yHighlighted ~/ 3;

    highlightedValue = getSudokuFieldValue(highlighted);
  }
}
