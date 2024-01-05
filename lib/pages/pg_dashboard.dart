import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_dashboard_controller.dart';
import 'package:sudoku/widgets/buttons_widget.dart';
import 'package:sudoku/widgets/text_widgets.dart';

class PgDashboard extends GetView<DashboardPageController> {
  const PgDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextWidgets.mainSudokuText(inputText: "Sudoku"),
              SizedBox(height: 100),
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: MyButtons.mainButtonWidget(
                    inputFunction: controller.onClickPlayButton,
                    inputText: "Play"),
              ),
              // SizedBox(height: 8),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width - 32,
              //   child: MyButtons.mainButtonWidget(
              //       inputFunction: controller.onClickAlgorythmsButton,
              //       inputText: "Algorythms"),
              // ),
            ]),
      ),
    );
  }
}
