import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tgs4_3/app/modules/home/controllers/home_controller.dart';
import 'package:tgs4_3/app/modules/home/views/login_view.dart';

class RegisterView extends GetView<RegisterController> {
  

  final RegisterController controller = Get.put(RegisterController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              TextFormField(
                controller: controller.phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.validateInputs();
                },
                child: const Text('Register'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(LoginView());
                    },
                    child: const Text('Sudah Punya Akun? Masuk di sini'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
