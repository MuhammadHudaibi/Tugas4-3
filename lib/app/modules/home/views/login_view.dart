import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tgs4_3/app/modules/home/controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: GoogleFonts.poppins(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle:  GoogleFonts.poppins(),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),            
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:  GoogleFonts.poppins(),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  controller.validateInputs();
                },
                child: Text('Login', style:  GoogleFonts.poppins(color: Colors.white),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
