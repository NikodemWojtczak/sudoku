import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/app_controller.dart';
import 'package:sudoku/models/buttons_events/button_events.dart';
import 'package:sudoku/models/enums/Levels.dart';
import 'package:sudoku/models/sudoku_board_model.dart';

class SudokuController extends GetxController {
  final List<ButtonEvents> _gameEvents = [];
  SudokuBoard sudokuBoard = SudokuBoard();
  int numbersOfHint = 2;
  int numbersOfSuperPencil = 2;
  late int level;
  late Levels difficulty;
  late bool isCustom = false;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  AppController appController = Get.find();
  bool isGameOn = false;

  @override
  void onInit() async {
    super.onInit();
    Map<String, String> secureStorageData = await _secureStorage.readAll();
    log(secureStorageData.toString());
    if (secureStorageData.containsKey('numberOfHints')) {
      numbersOfHint =
          int.tryParse(secureStorageData['numberOfHints'] ?? '0') ?? 0;
    } else {
      await _secureStorage.write(
          key: 'numberOfHints', value: numbersOfHint.toString());
    }

    if (secureStorageData.containsKey('numbersOfSuperPencils')) {
      numbersOfSuperPencil =
          int.tryParse(secureStorageData['numbersOfSuperPencils'] ?? '0') ?? 0;
    } else {
      await _secureStorage.write(
          key: 'numbersOfSuperPencils', value: numbersOfSuperPencil.toString());
    }
  }

  Future increaseNumbersOfHints() async {
    numbersOfHint++;
    await _secureStorage.write(
        key: 'numberOfHints', value: numbersOfHint.toString());
  }

  Future decreaseNumbersOfHints() async {
    numbersOfHint--;
    await _secureStorage.write(
        key: 'numberOfHints', value: numbersOfHint.toString());
  }

  Future increaseNumbersOfSuperPencils() async {
    numbersOfSuperPencil++;
    await _secureStorage.write(
        key: 'numbersOfSuperPencils', value: numbersOfSuperPencil.toString());
  }

  Future decreaseNumbersOfSuperPencils() async {
    numbersOfSuperPencil--;
    await _secureStorage.write(
        key: 'numbersOfSuperPencils', value: numbersOfSuperPencil.toString());
  }

  void addAction(ButtonEvents buttonEvents) {
    buttonEvents.execute();
    _gameEvents.add(buttonEvents);
  }

  void undoAction() {
    if (_gameEvents.isNotEmpty) {
      _gameEvents.removeLast().undo();
    }
  }

  void loadLevel(int level, Levels difficulty) {
    _gameEvents.clear();
    level = level;
    difficulty = difficulty;
    switch (difficulty) {
      case Levels.easy:
        sudokuBoard
            .loadSudokuBoard(List.from(appController.sudokuBoardsEasy[level]));
        break;
      case Levels.medium:
        sudokuBoard.loadSudokuBoard(
            List.from(appController.sudokuBoardsMedium[level]));
        break;
      case Levels.hard:
        sudokuBoard
            .loadSudokuBoard(List.from(appController.sudokuBoardsHard[level]));
        break;
    }
    isGameOn = true;
  }

  void loadSudokuBoard(List<int> board) {
    _gameEvents.clear();
    level = 0;
    sudokuBoard.loadSudokuBoard(board);

    isGameOn = true;
  }

  Future saveProgress() async {}
}
