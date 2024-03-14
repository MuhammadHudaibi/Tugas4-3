import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

class HomeView extends StatelessWidget {
  final String loggedInEmail = GetStorage().read('fullname') ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Logged in as: $loggedInEmail',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
