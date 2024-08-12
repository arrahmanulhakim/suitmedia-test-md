import 'package:get/get.dart';

import '../../../models/user.dart';

class DynamicLabelsController extends GetxController {
  final nameLabelOne = Get.arguments['name'] ?? '';
  final selectedUserLabel = 'Selected User Name'.obs;

  void updateSelectedUser(User user) {
    selectedUserLabel.value = '${user.firstName} ${user.lastName}';
  }
}
