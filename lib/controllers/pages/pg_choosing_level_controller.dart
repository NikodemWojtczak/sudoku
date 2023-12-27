import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/pages.dart';

enum Levels { hard, medium, easy }

class PgChoosingLevelController extends GetxController {
  Rx<Levels> currentLevel = Levels.easy.obs;
  SudokuController sudokuController = Get.find();
  Rx<int> numberOfLevels = 0.obs;
  RxList progressEasy = [].obs;
  RxList progressMedium = [].obs;
  RxList progressHard = [].obs;
  late int level;

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
    update();
  }

  onClickLevel({required int levelInput}) {
    sudokuController.loadLevel(levelInput, currentLevel.value);
    level = levelInput;

    Get.toNamed(Pages.pgSudokuGame);
  }
}
