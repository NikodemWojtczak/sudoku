import 'package:flutter/material.dart';
import 'package:sudoku/utils/my_colors.dart';

class MyTextWidgets {
  static Widget mainSudokuText({required String inputText}) {
    return Text(
      inputText,
      style: TextStyle(
          color: MyColors.primary, fontWeight: FontWeight.bold, fontSize: 92),
    );
  }

  static Widget levelText({required String inputText}) {
    return Text(
      inputText,
      style: TextStyle(
          color: MyColors.primary, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  static Widget titleText({required String inputText}) {
    return Text(
      inputText,
      style: TextStyle(
          color: MyColors.primary, fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
