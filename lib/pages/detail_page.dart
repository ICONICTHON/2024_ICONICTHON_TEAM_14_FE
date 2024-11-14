import 'package:flutter/material.dart';
import '../models/post.dart';     // Post 모델

class DetailPage extends StatelessWidget {
  final Post post;

  const DetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Column(
        children: [
          Text(post.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(post.content),
          SizedBox(height: 10),
          Text("By: ${post.author}"),
          Text("Created at: ${post.createdAt.toLocal()}"),
        ],
      ),
    );
  }
}