import 'package:flutter/material.dart';
import 'havruta_write.dart';

class Havruta extends StatelessWidget {
  final List<Question> questions = [
    Question(
      id: 2,
      category: '컴퓨터 구성',
      title: 'Half Adder 구현 관련 질문',
      content: 'Half Adder를 구성하는 중에 에러가 뜨는데 이유를 모르겠어요.',
      status: '해결 중',
      imageUrl: 'assets/images/pic1.png',
    ),
    Question(
      id: 1,
      category: '신호와 시스템',
      title: '푸리에 변환 질문',
      content: '푸리에 변환할때 jw가 무슨 의미인가요?',
      status: '해결 완료',
      imageUrl: 'assets/images/pic2.png',
    ),
    // 다른 질문을 추가할 수 있습니다.
  ];

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
              child: Text("수강 과목", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/havruta');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: Text("하브루타", style: TextStyle(color: Colors.black))),
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
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("질문 검색   "),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: TextField(),
                width: 600,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffDB7223),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1.8),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HavrutaWrite()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.message_sharp,
                        color: Colors.white,
                      ),
                      Text(
                        "질문 작성",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                        builder: (context) => QADetailPage(question: question),
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
                      leading: Image.asset(question.imageUrl),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QADetailPage extends StatelessWidget {
  final Question question;

  QADetailPage({required this.question});

  final List<Comment> comments = [
    Comment(
        author: '학생A', content: 'jw는 복소수 표현에서 주파수를 나타내는 값이에요.', parentid: 1),
    Comment(author: '학생B', content: '변환 후 주파수 영역에서 사용되는 값이죠.', parentid: 1),
    Comment(author: '학생A', content: "더 자세히 보여주실 수 있나요?", parentid: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q&A Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${question.category} (${question.status})',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 8.0),
              Text(
                'Q. ${question.title}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                question.content,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Image.network(question.imageUrl),
              SizedBox(height: 16.0),
              Divider(),
              Text(
                'A1.',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                comments[question.id].content,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              ExpansionTile(
                title: Text(
                  '댓글 (${comments.length})',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                children: comments
                    .map((comment) => ListTile(
                          title: Text(comment.author),
                          subtitle: Text(comment.content),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String category;
  final String title;
  final String content;
  final String status;
  final String imageUrl;
  final int id;

  Question({
    required this.category,
    required this.title,
    required this.content,
    required this.status,
    required this.imageUrl,
    required this.id,
  });
}

class Comment {
  final String author;
  final String content;
  final int parentid;

  Comment({
    required this.author,
    required this.content,
    required this.parentid,
  });
}
