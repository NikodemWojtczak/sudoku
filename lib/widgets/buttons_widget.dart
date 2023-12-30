import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/pages/pg_sudoku_game.dart';
import 'package:sudoku/utils/my_colors.dart';
import 'package:sudoku/utils/my_strings.dart';
import 'package:sudoku/widgets/pop_up.dart';
import 'package:sudoku/widgets/text_widgets.dart';

class MyButtons {
  static Widget mainButtonWidget(
      {required VoidCallback inputFunction, required String inputText}) {
    return OutlinedButton(
        onPressed: inputFunction,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.primary)),
        child: FittedBox(
          child: Text(
            inputText,
            style: TextStyle(
                color: MyColors.background,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  static Widget backButtonWidget() {
    return IconButton(
      onPressed: () {
        SudokuController sudokuController = Get.find();
        if (sudokuController.isGameOn) {
          MyPopUp.yesNoPopUp("Warning", MyStrings.gameOnWarning, () {
            sudokuController.isGameOn = false;
            Get.close(2);
          });
        } else {
          Get.back();
        }
      },
      icon: const Icon(Icons.arrow_back_ios_new),
      iconSize: 32,
    );
  }

  static Widget restartButtonWidget() {
    return IconButton(
      onPressed: () {
        SudokuGamePgController sudokuGamePgController = Get.find();
        MyPopUp.yesNoPopUp("Warning", MyStrings.gameRestart,
            sudokuGamePgController.onCLickRestart);
      },
      icon: const Icon(Icons.refresh_sharp),
      iconSize: 32,
    );
  }

  static Widget levelButtonWidget(
      {required bool isFinished, required int numberOfLevel}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.buttons,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextWidgets.levelText(
              inputText: "Level ${numberOfLevel.toString()}"),
          Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: MyColors.background),
            child: isFinished
                ? Icon(
                    Icons.check,
                    size: 40,
                    color: MyColors.finished,
                  )
                : Icon(
                    Icons.close,
                    size: 40,
                    color: MyColors.notFinished,
                  ),
          ),
        ],
      ),
    );
  }
}
