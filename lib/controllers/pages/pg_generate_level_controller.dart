import 'dart:math';

import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/models/enums/Levels.dart';
import 'package:sudoku/pages.dart';
import 'package:sudoku/services/sudoku_solvers/sudoku_backtracking.dart';
import 'package:sudoku/utils/my_constant_values.dart';

class GenerateLevelController extends GetxController {
  RxInt currentBlankFields = 0.obs;
  RxBool isCustom = true.obs;
  SudokuController sudokuController = Get.find();
  List<int> board = List.generate(81, (index) => 0);
  bool isGenerated = false;

  onAddClick() {
    if (currentBlankFields.value == 81) return;
    currentBlankFields.value++;
  }

  onRemoveClick() {
    if (currentBlankFields.value == 0) return;
    currentBlankFields.value--;
  }

  onCostomClick() {
    isCustom.value = true;
  }

  onGeneratePreviev() {
    board = _generateBoardWithEraseNumber(currentBlankFields.value);
    isGenerated = true;
    update();
  }

  onLevelClick(Levels levels) {
    switch (levels) {
      case Levels.easy:
        currentBlankFields.value = MyConstantValues.easyBlankFields;
        break;
      case Levels.medium:
        currentBlankFields.value = MyConstantValues.mediumBlankFields;
        break;
      case Levels.hard:
        currentBlankFields.value = MyConstantValues.hardBlankFields;
        break;
    }
    isCustom.value = false;
  }

  List<int> _generateBoardWithEraseNumber(int number) {
    board = SudokuBackTracking().generateSudoku();
    for (var i = 0; i < number; i++) {
      while (true) {
        int randomIndex = Random().nextInt(81);
        if (board[randomIndex] == 0) {
          continue;
        }
        board[randomIndex] = 0;
        break;
      }
    }
    return board;
  }

  onPlayClick() {
    if (!isGenerated) {
      board = _generateBoardWithEraseNumber(currentBlankFields.value);
      isGenerated = true;
    }
    sudokuController.loadSudokuBoard(board);
    Get.toNamed(Pages.pgSudokuGame, parameters: {"custom": "true"});
  }
}
