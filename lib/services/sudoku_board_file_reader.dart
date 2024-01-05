import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/app_controller.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/utils/paths.dart';
import 'package:flutter/services.dart' show rootBundle;

class SudokuBoardFileReader {
  PgChoosingLevelController pgChoosingLevelController = Get.find();
  AppController appController = Get.find();

  Future<List<List<int>>> _loadSudokuBoardsFromFile(String path) async {
    final String rawCsv = await rootBundle.loadString(path);

    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(rawCsv);

    return rowsAsListOfValues.map((innerList) {
      return innerList.map((item) {
        return int.parse(item.toString()); // Convert each item to int
      }).toList();
    }).toList();
  }

  Future<void> loadSudokuBoards() async {
    appController.sudokuBoardsEasy =
        await _loadSudokuBoardsFromFile(MyPaths.pathToEasyBoards);
    appController.sudokuBoardsMedium =
        await _loadSudokuBoardsFromFile(MyPaths.pathToMediumBoards);
    appController.sudokuBoardsHard =
        await _loadSudokuBoardsFromFile(MyPaths.pathToHardBoards);

    pgChoosingLevelController.numberOfLevels.value =
        appController.sudokuBoardsEasy.length;
  }
}
