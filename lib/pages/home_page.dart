import 'package:flutter/material.dart';
import '../models/post.dart'; // 상대 경로로 수정

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 예시 Post 객체 리스트 (author, createdAt, id 추가)
    List<Post> posts = [
      Post(
        id: 1,
        title: "Post 1",
        content: "Content for post 1",
        author: "Author 1",
        createdAt: DateTime.now(),
      ),
      Post(
        id: 2,
        title: "Post 2",
        content: "Content for post 2",
        author: "Author 2",
        createdAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text("By ${posts[index].author}"),
            onTap: () {
              // 해당 게시물을 클릭했을 때, '/detail' 페이지로 Post 객체 전달
              Navigator.pushNamed(
                context,
                '/detail', // 이동할 페이지
                arguments: posts[index], // 전달할 데이터 (Post 객체)
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createPost'); // 게시물 작성 페이지로 이동
        },
        child: Icon(Icons.add),
        tooltip: 'Create Post',
      ),
    );
  }
}
