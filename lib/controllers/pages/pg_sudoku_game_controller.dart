import 'package:get/get.dart';
import 'package:sudoku/pages.dart';

class SudokuGamePgController extends GetxController {
  onClickPlayButton() {
    Get.toNamed(Pages.pgChooseLevel);
  }

  onClickAlgorythmsButton() {
    Get.toNamed(Pages.pgAlgorythms);
  }
}
