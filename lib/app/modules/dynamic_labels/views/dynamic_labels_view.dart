import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/routes/app_pages.dart';
import 'package:suitmedia_test/app/utils/constans.dart';

import '../controllers/dynamic_labels_controller.dart';

class DynamicLabelsView extends GetView<DynamicLabelsController> {
  const DynamicLabelsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kBlueDarkColor,
          ),
        ),
        title: const Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Welcome\n',
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: controller.nameLabelOne,
                    style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  controller.selectedUserLabel.value,
                  style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.users_table),
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonBackgroundColor,
                foregroundColor: kTextButtonColor,
                minimumSize: const Size(double.infinity, 48),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
