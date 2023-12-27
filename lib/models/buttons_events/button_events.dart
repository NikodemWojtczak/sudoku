import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

abstract class ButtonEvents {
  SudokuController sudokuController = Get.find();

  void execute();
  void undo();
}
