import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sudoku/controllers/AdDsiplay.dart';
import 'package:sudoku/controllers/app_controller.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/controllers/pages/pg_dashboard_controller.dart';
import 'package:sudoku/controllers/pages/pg_generate_level_controller.dart';
import 'package:sudoku/controllers/pages/pg_sudoku_game_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/controllers/theme_controller.dart';
import 'package:sudoku/routes.dart';
import 'package:sudoku/pages.dart';
import 'package:sudoku/services/sudoku_board_file_reader.dart';
import 'package:sudoku/services/sudoku_progress_file_reader.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  controllersInitialization();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  await SudokuBoardFileReader().loadSudokuBoards();
  await SudokuProgressFileReader().loadSudokuProgresses();

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

controllersInitialization() {
  Get.put(AppController());
  Get.put(SudokuController());
  Get.put(ThemesController());
  Get.put(AdDsiplay());
  Get.put(DashboardPageController());
  Get.put(PgChoosingLevelController());
  Get.put(SudokuGamePgController());
  Get.put(GenerateLevelController());
}
