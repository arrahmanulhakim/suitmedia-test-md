import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController palindromeInput = TextEditingController();

  void isPalindrome() {
    String text = palindromeInput.text
        .replaceAll(RegExp(r'\s+'), '') // Menghapus spasi
        .replaceAll(
            RegExp(r'[^a-zA-Z0-9]'), '') // Menghapus karakter non-alfanumerik
        .toLowerCase(); // Mengubah menjadi huruf kecil

    if (text == text.split('').reversed.join()) {
      Get.snackbar('Result', 'is palindrome');
    } else {
      Get.snackbar('Result', 'not palindrome');
    }
  }
}
