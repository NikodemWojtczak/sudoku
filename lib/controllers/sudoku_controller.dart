import 'dart:math';

import 'package:get/get.dart';

class SudokuController extends GetxController {
  List<int> sudokuBoard = List.generate(81, (_) => Random().nextInt(9));
  Map<int, List<int>> hints = {};

  @override
  void onInit() {
    super.onInit();

    for (int i = 0; i < 81; i++) {
      hints[i] = [];
    }
  }

  void setValueSudokuBoard(int index, int value) {
    sudokuBoard[index] = value;
  }
}
