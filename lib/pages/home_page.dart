import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("동국대학교 하브루타"),
        backgroundColor: Color(0xffDB7223),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text("홈", style: TextStyle(color: Colors.black))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/course');
              },
              child: Text("수강 과목", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/havruta');
              },
              child: Text("하브루타", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/professor');
              },
              child: Text("교수님 답변", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mypage');
              },
              child: Text("내 정보", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 300,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 왼쪽 프로필 및 메뉴
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, size: 50),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "황지민\n2021112030\n정보통신공학과",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: Text("로그아웃"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      _buildMenuButton(Icons.question_answer, "내 활동", context),
                      _buildMenuButton(Icons.star, "관심있는 질문", context),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            // 중앙 신규 질문
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("신규 질문",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                  SizedBox(height: 10),
                  _buildQuestionTable(),
                ],
              ),
            ),
            SizedBox(width: 20),
            // 오른쪽 HOT 질문
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "HOT 질문",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontFamily: '동국체'),
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildQuestionTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String text, dynamic context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          if (text == "내 활동") {
            Navigator.pushNamed(context, '/mypage');
          } else if (text == "관심있는 질문") {
            Navigator.pushNamed(context, '/liked');
          }
        },
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200], // 수정된 부분
          foregroundColor: Colors.black, // 텍스트 색상
          minimumSize: Size(double.infinity, 50),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  Widget _buildQuestionTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: [
        _buildTableRow("컴퓨터 구성", "Half Adder 구현 관련 질문"),
        _buildTableRow("신호와 시스템", "라플라스 변환 관련 질문"),
        _buildTableRow("신호와 시스템", "4X1 MUX 구현 오류 해결"),
        _buildTableRow("자료구조와 실습", "quick sort 구현"),
        _buildTableRow("신호와 시스템", "푸리에 변환 관련 질문"),
      ],
    );
  }

  TableRow _buildTableRow(String subject, String question) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              text: subject,
              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "동국체"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(question),
        ),
      ],
    );
  }
}
