import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/pages/dashboard_controller.dart';
import 'package:sudoku/controllers/theme_controller.dart';
import 'package:sudoku/routes.dart';
import 'package:sudoku/utils/pages.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  resourcesStartupInitialization();

  ThemesController tc = Get.find();

  runApp(ThemeProvider(
    saveThemesOnChange: true,
    loadThemeOnInit: true,
    themes: [
      AppTheme(id: "normal", description: "theme", data: tc.globalTheme),
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

resourcesStartupInitialization() {
  Get.lazyPut(() => DashboardPageController());
  Get.put(ThemesController());
}
