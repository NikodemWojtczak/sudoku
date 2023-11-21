import 'package:get/get.dart';
import 'package:sudoku/pages/pg_dashboard.dart';
import 'package:sudoku/utils/pages.dart';

class Routes {
  static final routes = [
    GetPage(name: Pages.pgDashboard, page: () => PgDashboard()),
  ];
}
