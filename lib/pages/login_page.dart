import 'package:flutter/material.dart';
import 'home_page.dart'; // 홈 페이지로 이동

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5DC),
      appBar: AppBar(
        title: Text("로그인"),
        backgroundColor: Color(0xffB6A28E),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: '아이디'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '비밀번호'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // 로그인 후 홈 페이지로 이동
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text("로그인"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 로그인 후 홈 페이지로 이동
                      Navigator.pushNamed(context, '/createAccount');
                    },
                    child: Text("회원가입"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
