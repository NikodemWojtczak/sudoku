import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/utils/my_colors.dart';

class ThemesController extends GetxController {
  late ThemeData globalTheme;
  late ThemeData globalThemeDark;

  static Color get background {
    return MyColors.background;
  }

  static Color get buttons {
    return MyColors.buttons;
  }

  static Color get accent {
    return MyColors.accent;
  }

  static Color get primary {
    return MyColors.primary;
  }

  void loadTheme() async {
    globalThemeDark = ThemeData.dark();
    globalTheme = ThemeData.from(
      colorScheme: ColorScheme.light(
        outline: MyColors.primary,
        background: MyColors.background,
        primary: MyColors.primary,
        secondary: MyColors.accent,
      ),
      useMaterial3: true,
    );
  }
}
