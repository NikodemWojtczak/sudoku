import 'dart:math';

import 'package:get/get.dart';

class SudokuController extends GetxController {
  late List<int> sudokuBoard;
  Map<int, List<int>> hints = {};

  @override
  void onInit() {
    super.onInit();

    for (int i = 0; i < 81; i++) {
      hints[i] = [];
    }

    sudokuBoard = generateSudoku();
  }

  void setValueSudokuBoard(int index, int value) {
    sudokuBoard[index] = value;
  }

  List<int> generateSudoku() {
    List<int> sudokuBoard = List.generate(81, (index) => 0);
    _canBePlaced(sudokuBoard, 0, 0);

    return sudokuBoard;
  }

  bool _canBePlaced(List<int> board, int index, int value) {
    int x = index % 9;
    int y = index ~/ 9;
    int boxX = x ~/ 3;
    int boxY = y ~/ 3;
    int boxOffset = 27 * boxY + 3 * boxX;
    for (var i = 0; i < 9; i++) {
      int columnsValues = board[x + i * 9];
      int rowsValues = board[y * 9 + i];
      int boxsValues = board[boxOffset + i % 3 + 9 * (i ~/ 3)];
      if (columnsValues == value ||
          rowsValues == value ||
          boxsValues == value) {
        return false;
      }
    }
    return true;
  }
}
