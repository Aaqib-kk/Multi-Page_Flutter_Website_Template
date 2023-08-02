import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dummy email text field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            // Dummy password text field
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home page when login button is pressed
                Navigator.pop(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
