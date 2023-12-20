import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/utils/paths_to_boards.dart';
import 'package:flutter/services.dart' show rootBundle;

class SudokuBoardFileReader {
  SudokuController sudokuController = Get.find();

  Future<List<List<int>>> _loadSudokuBoardsFromFile(String path) async {
    // final file = File(Directory(path).);
    // String rawCsv = await file.readAsString();
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
        await _loadSudokuBoardsFromFile(PathsToBoards.pathToEasyBoards);
    sudokuController.sudokuBoardsMedium =
        await _loadSudokuBoardsFromFile(PathsToBoards.pathToMediumBoards);
    sudokuController.sudokuBoardsHard =
        await _loadSudokuBoardsFromFile(PathsToBoards.pathToHardBoards);
  }
}
