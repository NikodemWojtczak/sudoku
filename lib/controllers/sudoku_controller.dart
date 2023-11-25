import 'dart:math';

import 'package:get/get.dart';

class SudokuController extends GetxController {
  List<int> sudokuBoard = List.generate(81, (_) => Random().nextInt(9));

  void setValueSudokuBoard(int index, int value) {
    sudokuBoard[index] = value;
  }
}
