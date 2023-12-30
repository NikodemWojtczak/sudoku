import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/widgets/buttons_widget.dart';
import 'package:sudoku/widgets/sudoku_game_widgets/sudoku_field.dart';
import 'package:sudoku/widgets/sudoku_game_widgets/sudoku_game_buttons.dart';
import 'package:sudoku/widgets/text_widgets.dart';

class PgSudokuGame extends GetView<SudokuGamePgController> {
  PgSudokuGame({super.key});

  SudokuController sudokuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SudokuGamePgController>(builder: (context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButtons.backButtonWidget(),
                  MyTextWidgets.titleText(
                      inputText:
                          "Level ${controller.pgChoosingLevelController.level}"),
                  MyButtons.restartButtonWidget()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 81,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 9),
                    itemBuilder: (contex, index) {
                      return GestureDetector(
                          onTap: () => controller.onCLickField(index),
                          child: SudokuField().field(
                            value: sudokuController.sudokuBoard
                                .getFieldValue(index),
                            number: index,
                          ));
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
      ),
    );
  }
}
