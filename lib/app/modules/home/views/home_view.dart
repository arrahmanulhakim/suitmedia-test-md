import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:suitmedia_test/app/utils/constans.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/background 1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 76,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: const Center(
                    child: Icon(
                      Icons.person_add_alt_rounded,
                      size: 54,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                TextField(
                  controller: controller.nameInputController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Name',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controller.palindromeInput,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Palindrome',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () => controller.isPalindrome(),
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
                  child: const Text('CHECK'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      Routes.dynamic_labels,
                      arguments: {
                        'name': controller.nameInputController.text.toString(),
                      },
                    );
                    controller.nameInputController.clear();
                    controller.palindromeInput.clear();
                  },
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
                  child: const Text('NEXT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
