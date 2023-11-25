import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/widgets/buttons_widget.dart';
import 'package:sudoku/widgets/text_widgets.dart';

class PgChosingLevel extends GetView<PgChoosingLevelController> {
  const PgChosingLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: MyButtons.backButtonWidget(),
        title: Obx(() => MyTextWidgets.titleText(
            inputText:
                controller.currentLevel.string.split('.')[1].capitalize ?? "")),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MyButtons.mainButtonWidget(
                        inputFunction: () =>
                            controller.onClickChangeDifficulty(Levels.easy),
                        inputText: "Easy"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: MyButtons.mainButtonWidget(
                        inputFunction: () =>
                            controller.onClickChangeDifficulty(Levels.medium),
                        inputText: "Medium"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: MyButtons.mainButtonWidget(
                        inputFunction: () =>
                            controller.onClickChangeDifficulty(Levels.hard),
                        inputText: "Hard"),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 135,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onClickLevel(level: index);
                    },
                    child: MyButtons.levelButtonWidget(
                        isFinished: false, numberOfLevel: index + 1),
                  );
                },
              ),
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: MyButtons.mainButtonWidget(
                  inputFunction: () {}, inputText: "Generate level"),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
