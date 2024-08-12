import 'package:get/get.dart';

import '../controllers/users_table_controller.dart';

class UsersTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersTableController>(
      () => UsersTableController(),
    );
  }
}
