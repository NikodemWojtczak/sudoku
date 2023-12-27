import 'package:path_provider/path_provider.dart';

class MyPaths {
  static String pathToHardBoards = 'assets/sudoku_boards/listOfSudokuHard.csv';
  static String pathToMediumBoards =
      'assets/sudoku_boards/listOfSudokuMedium.csv';
  static String pathToEasyBoards = 'assets/sudoku_boards/listOfSudokuEasy.csv';

  Future<String> get pathToProgressEasy async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/easy_progress.csv';
  }

  Future<String> get pathToProgressMedium async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/my_file.txt';
  }

  Future<String> get pathToProgressHard async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/my_file.txt';
  }
}
