import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/utils/my_colors.dart';
import 'package:sudoku/utils/my_constant_values.dart';

class SudokuField {
  Widget field(
      {required int number, int highlighted = 10, required int value}) {
    int x = number % 9;
    int y = number ~/ 9;
    SudokuGamePgController sudokuGamePgController = Get.find();
    SudokuController sudokuController = Get.find();

    int xBox = x ~/ 3;
    int yBox = y ~/ 3;

    double borderWidth = MyConstantValues.borderWidth;
    Color boxBorderColor = MyColors.fieldBorderBox;
    Color regularEdgeBorderColor = MyColors.fieldBorderBasic;
    Color highlightedColor = MyColors.highlightedColor;
    Color pickedColor = MyColors.pickedColor;

    BoxDecoration boxDecoration = BoxDecoration(
      color: sudokuGamePgController.yHighlighted == y &&
              sudokuGamePgController.xHighlighted == x
          ? pickedColor
          : sudokuGamePgController.yHighlighted == y ||
                  sudokuGamePgController.xHighlighted == x ||
                  sudokuGamePgController.xHighlightedBox == xBox &&
                      sudokuGamePgController.yHighlightedBox == yBox
              ? highlightedColor
              : 0 == sudokuGamePgController.highlightedValue
                  ? null
                  : sudokuController.sudokuBoard.getFieldValue(number) ==
                          sudokuGamePgController.highlightedValue
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
    );

    if (value != 0) {
      return Container(
        decoration: boxDecoration,
        child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              ((value).toString()),
            )),
      );
    } else {
      return Container(
        decoration: boxDecoration,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return FittedBox(
                fit: BoxFit.none,
                child: Text(
                  sudokuController.sudokuBoard.hints[number]
                              ?.contains(index + 1) ??
                          false
                      ? (index + 1).toString()
                      : "",
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              );
            },
            itemCount: 9,
            physics: const NeverScrollableScrollPhysics()),
      );
    }
  }
}
