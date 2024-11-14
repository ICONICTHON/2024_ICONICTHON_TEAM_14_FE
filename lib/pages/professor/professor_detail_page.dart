import 'package:flutter/material.dart';
import '../havruta/question/question_detail_page.dart'; // QuestionDetailPage import 추가

class ProfessorDetailPage extends StatelessWidget {
  final String professorName;

  ProfessorDetailPage({required this.professorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$professorName 교수님'),
        backgroundColor: Color(0xffDB7223),
      ),
      // 배경색을 연회색으로 설정
      backgroundColor: Color(0xFFD3D3D3), // 연회색
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
            return Row(
              children: [
                // 교수님 정보 (왼쪽)
                Container(
                  width: isMobile
                      ? constraints.maxWidth * 0.4
                      : 200, // 모바일에서는 화면의 40%로 축소
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, size: 60),
                      ),
                      SizedBox(height: 10),
                      Text(
                        professorName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                // 질문 목록 (오른쪽)
                Expanded(
                  child: ListView(
                    children: [
                      _buildQuestionCategory('신호와 시스템', context),
                      _buildQuestionCategory('데이터 통신', context),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuestionCategory(String category, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        SizedBox(height: 10),
        Column(
          children: [
            _buildQuestionListItem(
                'Half Adder 구현 관련 질문',
                'Half Adder를 구성하는 중에 에러가 뜨는데 이유를 모르겠네요..ㅠㅠ',
                '김선주 교수님',
                '신호와 시스템',
                context),
            _buildQuestionListItem('표리에 변환 관련 질문', 'jw가 무슨 의미인가요? 도저히 이해가 안가네요',
                '김선주 교수님', '신호와 시스템', context),
            _buildQuestionListItem('Quick sort 구현 관련 질문',
                '다른 Quick sort 어떤 방식으로 구현하셨나요?', '김선주 교수님', '데이터 통신', context),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestionListItem(String title, String content,
      String professorName, String subjectName, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목 (굵게 표시)
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            // 내용
            Text(content),
            SizedBox(height: 10),
            // 추천 수, 조회 수, 답변 수
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.thumb_up, size: 14),
                SizedBox(width: 5),
                Text('추천수: 10'),
                SizedBox(width: 20),
                Icon(Icons.visibility, size: 14),
                SizedBox(width: 5),
                Text('조회수: 42'),
                SizedBox(width: 20),
                Icon(Icons.comment, size: 14),
                SizedBox(width: 5),
                Text('답변수: 2'),
              ],
            ),
            // 질문 클릭 시 QuestionDetailPage로 이동
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionDetailPage(
                      subjectName: subjectName,
                      professorName: professorName,
                      questionTitle: title,
                      questionContent: content,
                      answerContent: '이것은 답변 내용입니다.',
                    ),
                  ),
                );
              },
              child: Text("자세히 보기", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
