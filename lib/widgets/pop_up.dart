import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/widgets/buttons_widget.dart';

class MyPopUp {
  static void basicPopUp(String title, String content) {
    Get.defaultDialog(
      barrierDismissible: false,
      middleText: content,
      title: title,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
      middleTextStyle: const TextStyle(fontSize: 20),
      actions: [
        SizedBox(
          width: 300,
          child: MyButtons.mainButtonWidget(
              inputFunction: () {
                Get.back();
              },
              inputText: "Ok"),
        )
      ],
    );
  }

  static void complexPopup(String title, String content, List<Widget> buttons) {
    Get.defaultDialog(
        barrierDismissible: false,
        middleText: content,
        title: title,
        titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        middleTextStyle: const TextStyle(fontSize: 20),
        actions: List.generate(
            buttons.length,
            (index) => SizedBox(
                  width: 300,
                  child: buttons[index],
                )));
  }

  static void yesNoPopUp(String title, String content, Function onYes) {
    Get.defaultDialog(
      barrierDismissible: false,
      middleText: content,
      title: title,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
      middleTextStyle: const TextStyle(fontSize: 20),
      actions: [
        SizedBox(
          width: 300,
          child: MyButtons.mainButtonWidget(
              inputFunction: () {
                onYes();
              },
              inputText: "Yes"),
        ),
        SizedBox(
          width: 300,
          child: MyButtons.mainButtonWidget(
              inputFunction: () {
                Get.back();
              },
              inputText: "No"),
        )
      ],
    );
  }
}
