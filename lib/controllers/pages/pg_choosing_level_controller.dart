import 'dart:developer';

import 'package:get/get.dart';
import 'package:sudoku/controllers/app_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/models/enums/Levels.dart';
import 'package:sudoku/pages.dart';

class PgChoosingLevelController extends GetxController {
  Rx<Levels> currentLevel = Levels.easy.obs;
  SudokuController sudokuController = Get.find();
  AppController appController = Get.find();
  Rx<int> numberOfLevels = 0.obs;
  RxList progressEasy = [].obs;
  RxList progressMedium = [].obs;
  RxList progressHard = [].obs;
  late int level;

  @override
  onInit() {
    progressEasy.value = appController.progressEasy;
    progressMedium.value = appController.progressMedium;
    progressHard.value = appController.progressHard;
    log(progressHard.toString());
    super.onInit();
  }

  onClickChangeDifficulty(Levels inputCurrentLevel) {
    currentLevel.value = inputCurrentLevel;
    appController.difficulty = inputCurrentLevel;
    switch (inputCurrentLevel) {
      case Levels.easy:
        numberOfLevels.value = appController.sudokuBoardsEasy.length;
        break;
      case Levels.medium:
        numberOfLevels.value = appController.sudokuBoardsMedium.length;
        break;
      case Levels.hard:
        numberOfLevels.value = appController.sudokuBoardsHard.length;
        break;
    }
    update();
  }

  onClickLevel({required int levelInput}) {
    sudokuController.loadLevel(levelInput, currentLevel.value);
    level = levelInput;
    appController.level = levelInput;
    Get.toNamed(Pages.pgSudokuGame);
  }

  onGenerateLevel() {
    Get.toNamed(Pages.pgGenerateLevel);
  }
}
