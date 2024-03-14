import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tgs4_3/app/modules/home/views/home_view.dart';
import 'package:tgs4_3/app/modules/home/views/login_view.dart';


class RegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validateInputs() {
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Validation Error',
        'Please enter a valid email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (!GetUtils.isPhoneNumber(phoneNumberController.text)) {
      Get.snackbar(
        'Validation Error',
        'Please enter a valid phone number',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (passwordController.text.length < 6) {
      Get.snackbar(
        'Validation Error',
        'Password must be at least 6 characters long',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (fullNameController.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please enter your full name',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Menyimpan data inputan
      saveData();
      register();
    }
  }

  void register() {
    Get.snackbar(
      'Registration Success',
      'You have been registered successfully',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Setelah pendaftaran berhasil, arahkan ke halaman login
    Get.off(LoginView());
  }

  void saveData() {
    // Menyimpan email ke penyimpanan lokal
    GetStorage().write('registeredEmail', emailController.text);
    GetStorage().write('fullname', fullNameController.text);
    GetStorage().write('phoneNumber', phoneNumberController.text);
    GetStorage().write('password', passwordController.text);
  }
}

class LoginController extends GetxController {
  final String loggedInEmail = GetStorage().read('registeredEmail') ?? '';
  final String loggedInPassword = GetStorage().read('password') ?? '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validateInputs() {
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Validation Error',
        'Please enter a valid email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (passwordController.text.length < 6) {
      Get.snackbar(
        'Validation Error',
        'Password must be at least 6 characters long',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      if (emailController.text == loggedInEmail && passwordController.text == loggedInPassword) {
        login();
        
      } 
      else {
        Get.snackbar(
          'Error',
          'Wrong Email or Pass',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  void login() {
    Get.snackbar(
      'Login Success',
      'You have been logged in successfully',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Setelah login berhasil, arahkan ke halaman Home
    Get.offAll(HomeView());
  }
}

class HomeController extends GetxController {
}
