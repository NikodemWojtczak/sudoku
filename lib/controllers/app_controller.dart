import 'package:get/get.dart';
import 'package:sudoku/models/enums/Levels.dart';
import 'package:sudoku/services/sudoku_progress_file_reader.dart';
import 'package:sudoku/utils/paths.dart';

class AppController extends GetxController {
  late List<List<int>> sudokuBoardsHard;
  late List<List<int>> sudokuBoardsEasy;
  late List<List<int>> sudokuBoardsMedium;
  late int level;
  Levels difficulty = Levels.easy;

  List progressEasy = [];
  List progressMedium = [];
  List progressHard = [];

  Future updateProgress() async {
    switch (difficulty) {
      case Levels.easy:
        progressEasy[level] = 1;
        await SudokuProgressFileReader()
            .rewriteFile(await MyPaths().pathToProgressEasy, progressEasy);
        break;
      case Levels.medium:
        progressMedium[level] = 1;
        await SudokuProgressFileReader()
            .rewriteFile(await MyPaths().pathToProgressMedium, progressMedium);
        break;
      case Levels.hard:
        progressHard[level] = 1;
        await SudokuProgressFileReader()
            .rewriteFile(await MyPaths().pathToProgressHard, progressHard);
        break;
    }
  }
}
