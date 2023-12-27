import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/models/buttons_events/button_events.dart';
import 'package:sudoku/models/sudoku_board_model.dart';

class SudokuController extends GetxController {
  late List<List<int>> sudokuBoardsHard;
  late List<List<int>> sudokuBoardsEasy;
  late List<List<int>> sudokuBoardsMedium;

  final List<ButtonEvents> _gameEvents = [];

  SudokuBoard sudokuBoard = SudokuBoard();

  late int _level;
  late Levels _difficulty;

  bool isGameOn = false;

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
    _level = level;
    _difficulty = difficulty;
    switch (_difficulty) {
      case Levels.easy:
        sudokuBoard.loadSudokuBoard(List.from(sudokuBoardsEasy[_level]));
        break;
      case Levels.medium:
        sudokuBoard.loadSudokuBoard(List.from(sudokuBoardsMedium[_level]));
        break;
      case Levels.hard:
        sudokuBoard.loadSudokuBoard(List.from(sudokuBoardsHard[_level]));
        break;
    }
    isGameOn = true;
  }
}
