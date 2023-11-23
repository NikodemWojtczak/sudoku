import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';

class PgDashboard extends GetView<SudokuGamePgController> {
  const PgDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
