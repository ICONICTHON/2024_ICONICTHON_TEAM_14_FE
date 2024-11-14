import 'package:flutter/material.dart';
import '../home_page.dart'; // 홈 페이지로 이동

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경을 흰색으로 변경
      appBar: AppBar(
        title: Text("로그인"),
        backgroundColor: Color(0xffDB7223), // 주황색 배경
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 로고 이미지
                Image.asset(
                  'assets/images/logo2.png', // 로고 이미지 경로
                  height: 100, // 원하는 크기로 설정
                ),
                SizedBox(height: 40),
                // 아이디 입력 필드
                TextField(
                  decoration: InputDecoration(
                    labelText: '아이디',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                // 비밀번호 입력 필드
                TextField(
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                // 로그인 버튼
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // 로그인 후 홈 페이지로 이동
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffDB7223), // 주황색 배경
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // 사각형 버튼
                      ),
                    ),
                    child: Text(
                      "로그인",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // 회원가입 버튼
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // 회원가입 페이지로 이동
                      Navigator.pushNamed(context, '/createAccount');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey, // 회색 배경
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // 사각형 버튼
                      ),
                    ),
                    child: Text(
                      "회원가입",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
