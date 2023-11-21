import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/utils/my_colors.dart';
import 'package:sudoku/widgets/text_widgets.dart';

class MyButtons {
  static Widget mainButtonWidget(
      {required VoidCallback inputFunction, required String inputText}) {
    return OutlinedButton(
        onPressed: inputFunction,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.primary)),
        child: FittedBox(
          child: Text(
            inputText,
            style: TextStyle(
                color: MyColors.background,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  static Widget backButtonWidget() {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(Icons.arrow_back_ios_new),
      iconSize: 32,
    );
  }

  static Widget levelButtonWidget(
      {required bool isFinished, required int numberOfLevel}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColors.buttons,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextWidgets.levelText(
                inputText: "Level ${numberOfLevel.toString()}"),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: MyColors.background),
              child: isFinished
                  ? Icon(
                      Icons.check,
                      size: 40,
                      color: MyColors.finished,
                    )
                  : Icon(
                      Icons.close,
                      size: 40,
                      color: MyColors.notFinished,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
