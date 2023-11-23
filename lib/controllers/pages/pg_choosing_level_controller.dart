import 'package:get/get.dart';

enum Levels { hard, medium, easy }

class PgChoosingLevelController extends GetxController {
  Rx<Levels> currentLevel = Levels.easy.obs;

  onClickChangeLevel(Levels inputCurrentLevel) {
    currentLevel.value = inputCurrentLevel;
  }

  onClickPlayButton() {}

  onClickAlgorythmsButton() {}
}
