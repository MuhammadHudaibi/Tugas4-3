import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  final String loggedInFullName = GetStorage().read('fullname') ?? '';
  final String loggedInEmail = GetStorage().read('registeredEmail') ?? '';
  final String loggedInPhoneNumber = GetStorage().read('phoneNumber') ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View', style: GoogleFonts.poppins(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: GoogleFonts.poppins(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Logged in as: $loggedInFullName',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $loggedInEmail',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Phone Number: $loggedInPhoneNumber',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
