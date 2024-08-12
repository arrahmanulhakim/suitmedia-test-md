import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/users_table/bindings/users_table_binding.dart';
import 'package:suitmedia_test/app/modules/users_table/views/users_table_view.dart';

import '../modules/dynamic_labels/bindings/dynamic_labels_binding.dart';
import '../modules/dynamic_labels/views/dynamic_labels_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.dynamic_labelss,
      page: () => const DynamicLabelsView(),
      binding: DynamicLabelsBinding(),
    ),
    GetPage(
      name: _Paths.users_table,
      page: () => const UsersTableView(),
      binding: UsersTableBinding(),
    ),
  ];
}
