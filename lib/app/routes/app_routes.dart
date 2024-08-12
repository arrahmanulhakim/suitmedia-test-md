part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const dynamic_labels = _Paths.dynamic_labelss;
  static const users_table = _Paths.users_table;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const dynamic_labelss = '/dynamic_aabels';
  static const users_table = '/users_table';
}
