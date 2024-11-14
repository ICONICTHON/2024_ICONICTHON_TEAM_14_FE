import 'package:flutter/material.dart';

class MyCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("동국대학교 하브루타"),
        backgroundColor: Color(0xffDB7223),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text("홈", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/course');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: Text("수강 과목", style: TextStyle(color: Colors.black))),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // 양옆 여백 동일하게 설정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            // 내 수강 과목 헤더
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xffDB7223),
              child: Column(
                children: [
                  Text(
                    "내 수강 과목",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 20, width: 800),
            // 수강 과목 목록을 테이블 형식으로 표시
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 60, // 열 간격 설정
                columns: [
                  DataColumn(label: Text('과목명')),
                  DataColumn(
                    label: Container(
                      width: 800, // 질문 제목 부분의 넓이를 설정
                      child: Text(
                        '질문 제목',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('컴퓨터 구성')),
                    DataCell(Text('Half Adder 구현 관련 질문')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('신호와 시스템')),
                    DataCell(Text('라플라스 변환 관련 질문')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('컴퓨터 구성')),
                    DataCell(Text('4X1 MUX 구현 오류 해결')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('자료구조와 실습')),
                    DataCell(Text('quick sort 구현')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('신호와 시스템')),
                    DataCell(Text('푸리에 변환 관련 질문')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('컴퓨터 구성')),
                    DataCell(Text('Half Adder 구현 관련 질문')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('컴퓨터 구성')),
                    DataCell(Text('4X1 MUX 구현 오류 해결')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('신호와 시스템')),
                    DataCell(Text('라플라스 변환 관련 질문')),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
