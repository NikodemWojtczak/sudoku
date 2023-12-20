import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_algorythms_controller.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/controllers/pages/pg_dashboard_controller.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/controllers/theme_controller.dart';
import 'package:sudoku/routes.dart';
import 'package:sudoku/pages.dart';
import 'package:sudoku/services/sudoku_board_file_reader.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  resourcesStartupInitialization();

  SudokuBoardFileReader().loadSudokuBoards();

  ThemesController tc = Get.find();
  tc.loadTheme();

  runApp(ThemeProvider(
    saveThemesOnChange: true,
    loadThemeOnInit: true,
    themes: [
      AppTheme(id: "light", description: "theme", data: tc.globalTheme),
      AppTheme(id: "dark", description: "theme", data: tc.globalThemeDark),
    ],
    child: ThemeConsumer(
      child: Builder(
        builder: (themeContext) => GetMaterialApp(
          initialRoute: Pages.pgDashboard,
          getPages: Routes.routes,
          theme: ThemeProvider.themeOf(themeContext).data,
        ),
      ),
    ),
  ));
}

resourcesStartupInitialization() {
  Get.lazyPut(() => DashboardPageController(), fenix: true);
  Get.lazyPut(() => PgAlgorythmsController(), fenix: true);
  Get.lazyPut(() => SudokuGamePgController(), fenix: true);
  Get.lazyPut(() => PgChoosingLevelController(), fenix: true);
  Get.put(SudokuController());
  Get.put(ThemesController());
}
