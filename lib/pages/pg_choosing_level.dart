import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/widgets/buttons_widget.dart';

class PgChosingLevel extends GetView<PgChoosingLevelController> {
  const PgChosingLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                MyButtons.backButtonWidget(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MyButtons.mainButtonWidget(
                        inputFunction: () {}, inputText: "Easy"),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MyButtons.mainButtonWidget(
                        inputFunction: () {}, inputText: "Medium"),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MyButtons.mainButtonWidget(
                        inputFunction: () {}, inputText: "Hard"),
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
                  return MyButtons.levelButtonWidget(
                      isFinished: true, numberOfLevel: 100);
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
