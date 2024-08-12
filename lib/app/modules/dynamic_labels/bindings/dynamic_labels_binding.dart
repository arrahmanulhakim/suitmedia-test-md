import 'package:get/get.dart';

import '../controllers/dynamic_labels_controller.dart';

class DynamicLabelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DynamicLabelsController>(
      () => DynamicLabelsController(),
    );
  }
}
