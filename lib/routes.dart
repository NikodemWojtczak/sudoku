import 'package:get/get.dart';
import 'package:sudoku/pages/pg_algothms.dart';
import 'package:sudoku/pages/pg_choosing_level.dart';
import 'package:sudoku/pages/pg_dashboard.dart';
import 'package:sudoku/pages.dart';

class Routes {
  static final routes = [
    GetPage(name: Pages.pgDashboard, page: () => PgDashboard()),
    GetPage(name: Pages.pgAlgorythms, page: () => PgAlgorythms()),
    GetPage(name: Pages.pgChooseLevel, page: () => PgChosingLevel()),
  ];
}
