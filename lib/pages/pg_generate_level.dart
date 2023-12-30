import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_generate_level_controller.dart';
import 'package:sudoku/widgets/buttons_widget.dart';
import 'package:sudoku/widgets/text_widgets.dart';

class PgGenerateLevel extends GetView<GenerateLevelController> {
  const PgGenerateLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: MyButtons.backButtonWidget(),
        title: MyTextWidgets.titleText(inputText: "Generate level"),
      ),
      body: Container(),
    );
  }
}
