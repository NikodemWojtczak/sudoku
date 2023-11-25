import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/utils/my_colors.dart';

class SudokuField {
  static Widget field(
      {required int number, int highlighted = 10, required int value}) {
    int x = number % 9;
    int y = number ~/ 9;
    SudokuGamePgController sudokuGamePgController = Get.find();

    int xBox = x ~/ 3;
    int yBox = y ~/ 3;

    double borderWidth = 2.5;
    Color boxBorderColor = MyColors.fieldBorderBox;
    Color regularEdgeBorderColor = MyColors.fieldBorderBasic;
    Color highlightedColor = Colors.grey;
    Color pickedColor = Colors.red;

    return Container(
      decoration: BoxDecoration(
        color: sudokuGamePgController.yHighlighted == y &&
                sudokuGamePgController.xHighlighted == x
            ? pickedColor
            : sudokuGamePgController.getSudokuFieldValue(number) ==
                        sudokuGamePgController.highlightedValue ||
                    sudokuGamePgController.yHighlighted == y ||
                    sudokuGamePgController.xHighlighted == x ||
                    sudokuGamePgController.xHighlightedBox == xBox &&
                        sudokuGamePgController.yHighlightedBox == yBox
                ? highlightedColor
                : null,
        border: Border(
          top: y == 0
              ? BorderSide(width: borderWidth, color: boxBorderColor)
              : BorderSide.none,
          left: x == 0
              ? BorderSide(width: borderWidth, color: boxBorderColor)
              : BorderSide.none,
          right: BorderSide(
              width: borderWidth,
              color: x % 3 == 2 ? boxBorderColor : regularEdgeBorderColor),
          bottom: BorderSide(
              width: borderWidth,
              color: y % 3 == 2 ? boxBorderColor : regularEdgeBorderColor),
        ),
      ),
      child: Center(
          child: Text(
        ((value).toString()),
        style: const TextStyle(fontSize: 30),
      )),
    );
  }
}
