import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/widgets/buttons_widget.dart';
import 'package:sudoku/widgets/sudoku_field.dart';

class PgSudokuGame extends GetView<SudokuGamePgController> {
  const PgSudokuGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: MyButtons.backButtonWidget(),
      ),
      body: GetBuilder<SudokuGamePgController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 81,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
              itemBuilder: (contex, index) {
                return GestureDetector(
                  onTap: () => controller.onCLickField(index),
                  child: SudokuField.field(
                      number: index,
                      value: controller.getSudokuFieldValue(index)),
                );
              }),
        );
      }),
    );
  }
}
