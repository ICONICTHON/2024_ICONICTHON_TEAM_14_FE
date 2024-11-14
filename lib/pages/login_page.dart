import 'package:flutter/material.dart';
import 'home_page.dart';  // 홈 페이지로 이동

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 로그인 후 홈 페이지로 이동
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
