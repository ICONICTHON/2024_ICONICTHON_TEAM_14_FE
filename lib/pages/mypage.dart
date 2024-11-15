import 'package:flutter/material.dart';
import 'package:havruta_app/var.dart';
import 'havruta/havruta.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 프로필 영역
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              '황지민 2021112030\n정보통신공학과',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // 내가 쓴 질문 영역
            Text(
              '내가 쓴 질문',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QADetailPage(question: question),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(question.title),
                        subtitle: Text(question.content),
                        trailing: Text(
                          question.status,
                          style: TextStyle(
                              color: question.status == '해결 완료'
                                  ? Colors.green
                                  : Colors.red),
                        ),
                        leading: question.imageUrl.isNotEmpty
                            ? Image.asset(question.imageUrl)
                            : Text(""),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),

            // 내 정보 하단 메뉴
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // 로그아웃 버튼을 클릭하면 로그인 화면으로 이동
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('로그아웃'),
                      content: Text('로그아웃 하시겠습니까?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // 다이얼로그 닫기
                          },
                          child: Text('취소'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: Text("로그아웃"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('로그아웃', style: TextStyle(color: Colors.orange)),
            ),
          ],
        ),
      ),
    );
  }
}
