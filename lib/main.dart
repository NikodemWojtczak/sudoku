import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/pg_algorythms_controller.dart';
import 'package:sudoku/controllers/pages/pg_choosing_level_controller.dart';
import 'package:sudoku/controllers/pages/pg_dashboard_controller.dart';
import 'package:sudoku/controllers/theme_controller.dart';
import 'package:sudoku/routes.dart';
import 'package:sudoku/pages.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  resourcesStartupInitialization();

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
  Get.lazyPut(() => DashboardPageController());
  Get.lazyPut(() => PgAlgorythmsController());
  Get.lazyPut(() => PgChoosingLevelController());
  Get.put(ThemesController());
}
