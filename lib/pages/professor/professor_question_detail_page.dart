import 'package:flutter/material.dart';

class ProfessorQuestionDetailPage extends StatelessWidget {
  final String subjectName; // 과목명
  final String professorName; // 교수님 성함
  final String questionTitle; // 질문 제목
  final String questionContent; // 질문 내용
  final String answerContent; // 답변 내용
  final int likeCount; // 추천수
  final int viewCount; // 조회수
  final int commentCount; // 답변 수

  ProfessorQuestionDetailPage({
    required this.subjectName,
    required this.professorName,
    required this.questionTitle,
    required this.questionContent,
    required this.answerContent,
    this.likeCount = 0,
    this.viewCount = 0,
    this.commentCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subjectName ($professorName 교수님)'),
        backgroundColor: Color(0xffDB7223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 과목명과 교수명
            Text(
              '$subjectName ($professorName 교수님)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // 질문 제목
            Text(
              'Q. $questionTitle',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // 질문 내용
            Text(
              questionContent,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // 추천수, 조회수, 답변수
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.thumb_up, size: 14),
                SizedBox(width: 5),
                Text('추천수: $likeCount'),
                SizedBox(width: 20),
                Icon(Icons.visibility, size: 14),
                SizedBox(width: 5),
                Text('조회수: $viewCount'),
                SizedBox(width: 20),
                Icon(Icons.comment, size: 14),
                SizedBox(width: 5),
                Text('답변수: $commentCount'),
              ],
            ),
            SizedBox(height: 20),
            // 답변 작성 버튼
            ElevatedButton(
              onPressed: () {
                // 답변 작성 페이지로 이동할 수 있게 설정
                print('답변 작성 버튼 클릭됨');
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AnswerPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text("답변 작성", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            // 답변 내용
            Text(
              'A1. $answerContent',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
