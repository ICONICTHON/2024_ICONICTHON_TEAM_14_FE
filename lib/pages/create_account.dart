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
      backgroundColor: Color(0xffF5F5DC),
      appBar: AppBar(
        title: Text("회원가입"),
        backgroundColor: Color(0xffB6A28E),
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      //TODO
                      //여기에 컨트롤러들 이용해서 데이터 전송
                      // 로그인 후 홈 페이지로 이동
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text("계정 생성"),
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
