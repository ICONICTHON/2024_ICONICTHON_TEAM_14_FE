import 'package:flutter/material.dart';

class HavrutaDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q&A Board',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: QADetailPage(),
    );
  }
}

class QADetailPage extends StatelessWidget {
  final String category = '신호와 시스템 (류철 교수님)';
  final String title = '푸리에 변환 질문';
  final String content =
      '푸리에 변환할때 jw가 무슨 의미인가요? 도저히 이해가 안가네요 설명 해주실 분 구합니다..ㅠㅠ';
  final String imageUrl = 'assets/images/pic1.png';
  final List<Comment> comments = [
    Comment(author: '학생A', content: 'jw는 복소수 표현에서 주파수를 나타내는 값이에요.'),
    Comment(author: '학생B', content: '변환 후 주파수 영역에서 사용되는 값이죠.'),
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
                category,
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 8.0),
              Text(
                'Q. $title',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                content,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Image.network(imageUrl),
              SizedBox(height: 16.0),
              Divider(),
              Text(
                'A1.',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                '푸리에 변환에서 jw는 복소수 표현에서 주파수를 나타내는 값을 말합니다.',
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

class Comment {
  final String author;
  final String content;

  Comment({required this.author, required this.content});
}
