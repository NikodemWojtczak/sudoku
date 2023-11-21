import 'package:get/get.dart';
import 'package:sudoku/pages.dart';

class DashboardPageController extends GetxController {
  onClickPlayButton() {
    Get.toNamed(Pages.pgChooseLevel);
  }

  onClickAlgorythmsButton() {
    Get.toNamed(Pages.pgAlgorythms);
  }
}
