import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/dashboard_controller.dart';

class PgDashboard extends GetView<DashboardPageController> {
  const PgDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [Text("Sudoku")]),
    );
  }
}
