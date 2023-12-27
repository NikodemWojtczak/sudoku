import 'dart:io';
import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/utils/paths.dart';

class SudokuProgressFileReader {
  PgChoosingLevelController pgChoosingLevelController = Get.find();

  Future<void> rewriteFile(String path, List progress) async {
    String csvData = const ListToCsvConverter().convert([progress]);
    final File file = File(path);
    await file.writeAsString(csvData);
  }

  Future<void> _writeNewFile(String path) async {
    List<List<dynamic>> rows = [List.generate(100, (index) => 0)];
    String csvData = const ListToCsvConverter().convert(rows);
    final File file = File(path);
    await file.writeAsString(csvData);
  }

  Future<List<List<dynamic>>> _loadSudokuProgressFromFile(String path) async {
    final file = File(path);
    final String rawCsv = await file.readAsString();
    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(rawCsv);

    return rowsAsListOfValues;
  }

  Future<void> loadSudokuProgresses() async {
    String pathToEasy = await MyPaths().pathToProgressEasy;
    String pathToMedium = await MyPaths().pathToProgressMedium;
    String pathToHard = await MyPaths().pathToProgressHard;

    if (await File(pathToEasy).exists()) {
      pgChoosingLevelController.progressEasy.value =
          (await _loadSudokuProgressFromFile(pathToEasy))[0];
    } else {
      await _writeNewFile(pathToEasy);
    }

    if (await File(pathToMedium).exists()) {
      pgChoosingLevelController.progressMedium.value =
          (await _loadSudokuProgressFromFile(pathToMedium))[0];
    } else {
      await _writeNewFile(pathToMedium);
    }

    if (await File(pathToHard).exists()) {
      pgChoosingLevelController.progressHard.value =
          (await _loadSudokuProgressFromFile(pathToHard))[0];
    } else {
      await _writeNewFile(pathToHard);
    }
  }
}
