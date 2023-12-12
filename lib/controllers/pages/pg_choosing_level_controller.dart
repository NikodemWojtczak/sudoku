import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/pages.dart';

enum Levels { hard, medium, easy }

class PgChoosingLevelController extends GetxController {
  Rx<Levels> currentLevel = Levels.easy.obs;
  SudokuController sudokuController = Get.find();

  onClickChangeDifficulty(Levels inputCurrentLevel) {
    currentLevel.value = inputCurrentLevel;
  }

  onClickLevel({required int level}) {
    sudokuController.generateSudoku();
    Get.toNamed(Pages.pgSudokuGame, arguments: {'level': level});
  }
}
