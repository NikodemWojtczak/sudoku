import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/pages.dart';
import 'package:sudoku/services/sudoku_solvers/sudoku_backtracking.dart';
import 'package:sudoku/utils/my_constant_values.dart';

class GenerateLevelController extends GetxController {
  RxInt currentBlankFields = 0.obs;
  RxBool isCustom = true.obs;
  SudokuController sudokuController = Get.find();

  onAddClick() {
    if (currentBlankFields.value == 81) return;
    currentBlankFields.value++;
  }

  onRemoveClick() {
    if (currentBlankFields.value == 0) return;
    currentBlankFields.value--;
  }

  onCostomClick() {
    isCustom.value = true;
  }

  onLevelClick(Levels levels) {
    switch (levels) {
      case Levels.easy:
        currentBlankFields.value = MyConstantValues.easyBlankFields;
        break;
      case Levels.medium:
        currentBlankFields.value = MyConstantValues.mediumBlankFields;
        break;
      case Levels.hard:
        currentBlankFields.value = MyConstantValues.hardBlankFields;
        break;
    }
    isCustom.value = false;
  }

  onPlayClick() {
    List<int> board = SudokuBackTracking().generateSudoku();
    sudokuController.loadSudokuBoard(board);
    sudokuController.sudokuBoard.eraseRandomFields(currentBlankFields.value);
    Get.toNamed(Pages.pgSudokuGame);
  }
}
