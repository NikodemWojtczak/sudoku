import 'dart:io';
import 'package:get/get.dart';

class SudokuController extends GetxController {
  late List<List<int>> sudokuBoardsHard;
  late List<List<int>> sudokuBoardsEasy;
  late List<List<int>> sudokuBoardsMedium;

  late List<int> sudokuBoard;
  Map<int, List<int>> hints = {};

  void setValueSudokuBoard(int index, int value) {
    sudokuBoard[index] = value;
  }
}
