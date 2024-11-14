import 'package:flutter/material.dart';

// Post 클래스 정의 (예시)
class Post {
  final String title;
  final String content;

  Post({required this.title, required this.content});
}

class DetailPage extends StatelessWidget {
  final Post? post; // nullable한 Post 객체

  const DetailPage({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: post == null
          ? Center(child: Text('No post available.'))
          : Column(
        children: [
          Text(post!.title), // post가 null이 아니면 데이터 사용
          Text(post!.content),
        ],
      ),
    );
  }
}
