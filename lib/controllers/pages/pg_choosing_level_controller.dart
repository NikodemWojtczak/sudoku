import 'package:get/get.dart';
import 'package:sudoku/pages.dart';

enum Levels { hard, medium, easy }

class PgChoosingLevelController extends GetxController {
  Rx<Levels> currentLevel = Levels.easy.obs;

  onClickChangeDifficulty(Levels inputCurrentLevel) {
    currentLevel.value = inputCurrentLevel;
  }

  onClickLevel({required int level}) {
    Get.toNamed(Pages.pgSudokuGame, arguments: {'level': level});
  }
}
