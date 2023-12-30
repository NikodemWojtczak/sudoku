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
              child: GetBuilder<PgChoosingLevelController>(builder: (_) {
                return Obx(
                  () => GridView.builder(
                    itemCount: controller.numberOfLevels.value,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 135,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      bool isFinished;
                      switch (controller.currentLevel.value) {
                        case Levels.easy:
                          isFinished = controller.progressEasy[index] == 1;
                          break;
                        case Levels.medium:
                          isFinished = controller.progressMedium[index] == 1;
                          break;
                        case Levels.hard:
                          isFinished = controller.progressHard[index] == 1;
                          break;
                      }
                      return GestureDetector(
                        onTap: () {
                          controller.onClickLevel(levelInput: index);
                        },
                        child: MyButtons.levelButtonWidget(
                            isFinished: isFinished, numberOfLevel: index + 1),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: MyButtons.mainButtonWidget(
                inputFunction: () => controller.onGenerateLevel(),
                inputText: "Generate level"),
          ),
          const SizedBox(height: 12),
        ],
      )),
    );
  }
}
