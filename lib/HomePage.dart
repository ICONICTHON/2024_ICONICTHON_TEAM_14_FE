import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: ListView.builder(
        itemCount: 10, // 예시로 10개의 게시물 목록 생성
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Post $index"),
            onTap: () {
              Navigator.pushNamed(context, '/detail');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createPost');
        },
        child: Icon(Icons.add),
        tooltip: 'Create Post',
      ),
    );
  }
}
