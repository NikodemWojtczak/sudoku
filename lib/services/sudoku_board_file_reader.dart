import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/utils/paths.dart';
import 'package:flutter/services.dart' show rootBundle;

class SudokuBoardFileReader {
  SudokuController sudokuController = Get.find();
  PgChoosingLevelController pgChoosingLevelController = Get.find();

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
    sudokuController.sudokuBoardsEasy =
        await _loadSudokuBoardsFromFile(MyPaths.pathToEasyBoards);
    sudokuController.sudokuBoardsMedium =
        await _loadSudokuBoardsFromFile(MyPaths.pathToMediumBoards);
    sudokuController.sudokuBoardsHard =
        await _loadSudokuBoardsFromFile(MyPaths.pathToHardBoards);

    pgChoosingLevelController.numberOfLevels.value =
        sudokuController.sudokuBoardsEasy.length;
  }
}
