import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/utils/my_colors.dart';
import 'package:sudoku/widgets/text_widgets.dart';

const double iconSize = 45;

class SudokuGameButtons {
  SudokuGamePgController sudokuGamePgController = Get.find();

  Widget numberButton(int number) {
    return Expanded(
        child: TextButton(
            onPressed: () => sudokuGamePgController.onCLickNumber(number),
            child: Text(
              number.toString(),
              style: TextStyle(
                  fontSize: 50,
                  color: sudokuGamePgController.isPencilOn
                      ? MyColors.primary
                      : MyColors.accent),
            )));
  }

  Widget undoButton() {
    return Expanded(
        child: Column(
      children: [
        IconButton(
            onPressed: () => sudokuGamePgController.onCLickUndo(),
            icon: const Icon(
              Icons.undo,
              size: iconSize,
            )),
        MyTextWidgets.sudokuGameButtonText(inputText: "Undo")
      ],
    ));
  }

  Widget pencilButton() {
    return Expanded(
        child: Column(
      children: [
        IconButton(
            onPressed: () => sudokuGamePgController.onCLickPencil(),
            icon: Icon(
              Icons.mode_edit,
              size: iconSize,
              color: sudokuGamePgController.isPencilOn ? MyColors.accent : null,
            )),
        MyTextWidgets.sudokuGameButtonText(inputText: "Pencil")
      ],
    ));
  }

  Widget checkButton() {
    return Expanded(
        child: Column(
      children: [
        IconButton(
            onPressed: () => sudokuGamePgController.onCLickCheck(),
            icon: const Icon(
              Icons.check,
              size: iconSize,
            )),
        MyTextWidgets.sudokuGameButtonText(inputText: "Check")
      ],
    ));
  }

  Widget hintButton() {
    return Expanded(
        child: Column(
      children: [
        Stack(children: [
          IconButton(
              onPressed: () => sudokuGamePgController.onCLickHint(),
              icon: const Icon(
                Icons.lightbulb_outline,
                size: iconSize,
              )),
          Container(
              padding: EdgeInsets.all(8),
              child: Text(
                "9",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.accent,
              )),
        ]),
        MyTextWidgets.sudokuGameButtonText(inputText: "Hint")
      ],
    ));
  }

  Widget quicklButton() {
    return Expanded(
        child: Column(
      children: [
        Stack(
          children: [
            IconButton(
                onPressed: () => sudokuGamePgController.onCLickSuperPencil(),
                icon: const Icon(
                  Icons.draw,
                  size: iconSize,
                )),
            Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "9",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.accent,
                )),
          ],
        ),
        MyTextWidgets.sudokuGameButtonText(inputText: "Quick")
      ],
    ));
  }
}
