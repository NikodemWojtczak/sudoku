import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/models/buttons_events/button_event_hint.dart';
import 'package:sudoku/models/buttons_events/button_event_quick_pencil.dart';
import 'package:sudoku/models/buttons_events/button_event_remove_hint_value.dart';
import 'package:sudoku/models/buttons_events/button_event_set_field_value.dart';
import 'package:sudoku/models/buttons_events/button_event_set_hint_value.dart';
import 'package:sudoku/services/sudoku_progress_file_reader.dart';
import 'package:sudoku/utils/my_strings.dart';
import 'package:sudoku/utils/paths.dart';
import 'package:sudoku/widgets/pop_up.dart';

class SudokuGamePgController extends GetxController {
  PgChoosingLevelController pgChoosingLevelController = Get.find();
  SudokuController sudokuController = Get.find();
  int highlightedField = 100;
  int xHighlighted = 10;
  int yHighlighted = 10;
  int xHighlightedBox = 10;
  int yHighlightedBox = 10;
  int highlightedValue = 100;
  bool isPencilOn = false;

  void onCLickField(int number) {
    highlightedField = number;
    _calculateHighlight();
    update();
  }

  void onCLickNumber(int number) {
    if (isPencilOn) {
      if (sudokuController.sudokuBoard.hints[highlightedField]
              ?.contains(number) ??
          false) {
        sudokuController
            .addAction(RemoveHintValueEvents(highlightedField, number));
      } else {
        sudokuController
            .addAction(SetHintValueEvents(highlightedField, number));
      }
    } else {
      sudokuController.addAction(SetFieldValueEvents(highlightedField, number));
    }
    update();
  }

  void onCLickHint() {
    sudokuController.addAction(HintEvents());
    update();
  }

  void onCLickPencil() {
    isPencilOn = !isPencilOn;
    update();
  }

  void onCLickSuperPencil() {
    sudokuController.addAction(QuickPencilEvents());
    update();
  }

  void onCLickUndo() {
    sudokuController.undoAction();
    update();
  }

  void onCLickCheck() async {
    if (sudokuController.sudokuBoard.validate()) {
      switch (pgChoosingLevelController.currentLevel.value) {
        case Levels.easy:
          pgChoosingLevelController
              .progressEasy[pgChoosingLevelController.level] = 1;

          SudokuProgressFileReader().rewriteFile(
              await MyPaths().pathToProgressEasy,
              pgChoosingLevelController.progressEasy);
          break;
        case Levels.medium:
          pgChoosingLevelController
              .progressMedium[pgChoosingLevelController.level] = 1;

          SudokuProgressFileReader().rewriteFile(
              await MyPaths().pathToProgressMedium,
              pgChoosingLevelController.progressMedium);
          break;
        case Levels.hard:
          pgChoosingLevelController
              .progressHard[pgChoosingLevelController.level] = 1;

          SudokuProgressFileReader().rewriteFile(
              await MyPaths().pathToProgressHard,
              pgChoosingLevelController.progressHard);
          break;
      }
      pgChoosingLevelController.update();
      MyPopUp.basicPopUp("Success", MyStrings.gameWin);
    } else {
      MyPopUp.basicPopUp("Failure", MyStrings.gameFail);
    }
  }

  void _calculateHighlight() {
    xHighlighted = highlightedField % 9;
    yHighlighted = highlightedField ~/ 9;

    xHighlightedBox = xHighlighted ~/ 3;
    yHighlightedBox = yHighlighted ~/ 3;

    highlightedValue =
        sudokuController.sudokuBoard.getFieldValue(highlightedField);
  }
}
