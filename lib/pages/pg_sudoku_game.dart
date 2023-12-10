import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/widgets/buttons_widget.dart';
import 'package:sudoku/widgets/sudoku_game_widgets/sudoku_field.dart';
import 'package:sudoku/widgets/sudoku_game_widgets/sudoku_game_buttons.dart';

class PgSudokuGame extends GetView<SudokuGamePgController> {
  const PgSudokuGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: MyButtons.backButtonWidget(),
      ),
      body: GetBuilder<SudokuGamePgController>(builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 81,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 9),
                  itemBuilder: (contex, index) {
                    return GestureDetector(
                      onTap: () => controller.onCLickField(index),
                      child: SudokuField().field(
                          number: index,
                          value: controller.getSudokuFieldValue(index)),
                    );
                  }),
            ),
            Row(
              children: [
                SudokuGameButtons().undoButton(),
                SudokuGameButtons().hintButton(),
                SudokuGameButtons().pencilButton(),
                SudokuGameButtons().quicklButton(),
                SudokuGameButtons().checkButton(),
              ],
            ),
            Row(
              children: List.generate(
                  9, (index) => SudokuGameButtons().numberButton(index + 1)),
            )
          ],
        );
      }),
    );
  }
}
