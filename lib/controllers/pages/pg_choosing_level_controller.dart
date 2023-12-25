import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/pages.dart';

enum Levels { hard, medium, easy }

class PgChoosingLevelController extends GetxController {
  Rx<Levels> currentLevel = Levels.easy.obs;
  SudokuController sudokuController = Get.find();
  Rx<int> numberOfLevels = 0.obs;

  onClickChangeDifficulty(Levels inputCurrentLevel) {
    currentLevel.value = inputCurrentLevel;
    switch (inputCurrentLevel) {
      case Levels.easy:
        numberOfLevels.value = sudokuController.sudokuBoardsEasy.length;
        break;
      case Levels.medium:
        numberOfLevels.value = sudokuController.sudokuBoardsMedium.length;
        break;
      case Levels.hard:
        numberOfLevels.value = sudokuController.sudokuBoardsHard.length;
        break;
    }
  }

  onClickLevel({required int level}) {
    sudokuController.loadLevel(level, currentLevel.value);

    Get.toNamed(Pages.pgSudokuGame, arguments: {'level': level});
  }
}
