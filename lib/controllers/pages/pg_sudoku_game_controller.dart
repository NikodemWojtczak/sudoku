import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/models/buttons_events/button_event_hint.dart';
import 'package:sudoku/models/buttons_events/button_event_quick_pencil.dart';
import 'package:sudoku/models/buttons_events/button_event_remove_hint_value.dart';
import 'package:sudoku/models/buttons_events/button_event_set_field_value.dart';
import 'package:sudoku/models/buttons_events/button_event_set_hint_value.dart';
import 'package:sudoku/pages.dart';
import 'package:sudoku/services/sudoku_progress_file_reader.dart';
import 'package:sudoku/utils/my_strings.dart';
import 'package:sudoku/utils/paths.dart';
import 'package:sudoku/widgets/buttons_widget.dart';
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
    if (!sudokuController.isGameOn) return;
    if (sudokuController.sudokuBoard.isPredefined(highlightedField) ||
        highlightedField > 80 ||
        highlightedField < 0) {
      return;
    }

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

  void onCLickPencil() {
    if (!sudokuController.isGameOn) return;
    isPencilOn = !isPencilOn;
    update();
  }

  void onCLickHint() {
    if (!sudokuController.isGameOn) return;
    if (sudokuController.numbersOfHint > 0) {
      sudokuController.addAction(HintEvents());
    } else {
      MyPopUp.complexPopup("Warning", MyStrings.lackOfHints, [
        MyButtons.mainButtonWidget(
            inputFunction: () {
              sudokuController.increaseNumbersOfHints();
              Get.back();
              update();
            },
            inputText: "Watch an add"),
        MyButtons.mainButtonWidget(
            inputFunction: () {
              Get.back();
            },
            inputText: "Back")
      ]);
    }
    update();
  }

  void onCLickSuperPencil() {
    if (!sudokuController.isGameOn) return;
    if (sudokuController.numbersOfSuperPencil > 0) {
      sudokuController.addAction(QuickPencilEvents());
    } else {
      MyPopUp.complexPopup("Warning", MyStrings.lackOfSuperPencil, [
        MyButtons.mainButtonWidget(
            inputFunction: () {
              sudokuController.increaseNumbersOfSuperPencils();
              Get.back();
              update();
            },
            inputText: "Watch an add"),
        MyButtons.mainButtonWidget(
            inputFunction: () {
              Get.back();
            },
            inputText: "Back")
      ]);
    }
    update();
  }

  void onCLickUndo() {
    if (!sudokuController.isGameOn) return;
    sudokuController.undoAction();
    update();
  }

  void onCLickRestart() {
    sudokuController.sudokuBoard.resetSudokuBoard();
    Get.back();
    sudokuController.isGameOn = true;
    update();
  }

  void onBackToChoosingLevel() {
    Get.offNamedUntil(
        Pages.pgChooseLevel, ModalRoute.withName(Pages.pgDashboard));
  }

  void onCLickCheck() async {
    sudokuController.isGameOn = false;
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

      MyPopUp.complexPopup("Success", MyStrings.gameWin, [
        MyButtons.mainButtonWidget(
            inputFunction: onBackToChoosingLevel, inputText: "New game"),
        MyButtons.mainButtonWidget(
            inputFunction: onCLickRestart, inputText: "Restart"),
        MyButtons.mainButtonWidget(inputFunction: Get.back, inputText: "Back"),
      ]);
    } else {
      MyPopUp.complexPopup("Failure", MyStrings.gameFail, [
        MyButtons.mainButtonWidget(
            inputFunction: onBackToChoosingLevel, inputText: "New game"),
        MyButtons.mainButtonWidget(
            inputFunction: onCLickRestart, inputText: "Restart"),
        MyButtons.mainButtonWidget(inputFunction: Get.back, inputText: "Back"),
      ]);
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
