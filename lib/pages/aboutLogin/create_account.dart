import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController idcontroller = TextEditingController();
    TextEditingController pwcontroller = TextEditingController();
    TextEditingController pwcheckcontroller = TextEditingController();
    TextEditingController namecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("회원가입"),
        backgroundColor: Color(0xffDB7223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: idcontroller,
                    decoration: InputDecoration(labelText: '아이디'),
                  ),
                  TextField(
                    controller: pwcontroller,
                    decoration: InputDecoration(labelText: '비밀번호'),
                  ),
                  TextField(
                    controller: pwcheckcontroller,
                    decoration: InputDecoration(labelText: '비밀번호 확인'),
                    obscureText: true,
                  ),
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(labelText: '이름'),
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(labelText: '이메일'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // 로그인 후 홈 페이지로 이동
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffDB7223), // 주황색 배경
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 사각형 버튼
                        ),
                      ),
                      child: Text(
                        "계정 생성",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
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
