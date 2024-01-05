import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_generate_level_controller.dart';
import 'package:sudoku/models/enums/Levels.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4.5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              children: [
                MyButtons.mainButtonWidget(
                    inputFunction: () => controller.onLevelClick(Levels.easy),
                    inputText: "Easy"),
                MyButtons.mainButtonWidget(
                    inputFunction: () => controller.onLevelClick(Levels.medium),
                    inputText: "Medium"),
                MyButtons.mainButtonWidget(
                    inputFunction: () => controller.onLevelClick(Levels.hard),
                    inputText: "Hard"),
                MyButtons.mainButtonWidget(
                    inputFunction: () => controller.onCostomClick(),
                    inputText: "Custom"),
              ],
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FittedBox(
                        child: MyTextWidgets.titleText(
                            inputText: "Blank fields:")),
                    Container(),
                    if (controller.isCustom.value)
                      MyButtons.iconButtonWidget(
                          inputFunction: () => controller.onRemoveClick(),
                          icon: Icons.remove),
                    MyTextWidgets.titleText(
                        inputText: controller.currentBlankFields.toString()),
                    if (controller.isCustom.value)
                      MyButtons.iconButtonWidget(
                          inputFunction: () => controller.onAddClick(),
                          icon: Icons.add),
                    Container(),
                  ],
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: MyButtons.mainButtonWidget(
                      inputFunction: () => controller.onPlayClick(),
                      inputText: "Play")),
            ),
          ],
        ),
      ),
    );
  }
}
