// API // 홈페이지 코드(API 호출 테스트)
// 게시글 목록을 보여주는 화면. 삭제 및 수정 기능 추가
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post.dart';
import '../api/api_service.dart';  // ApiService import

class HomePage extends StatelessWidget {
  // 게시글 삭제 기능
  Future<void> _deletePost(BuildContext context, int postId) async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    await apiService.deletePost(postId);
  }

  // 게시글 수정 기능
  Future<void> _editPost(BuildContext context, Post post) async {
    Navigator.pushNamed(context, '/createPost', arguments: post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Consumer<ApiService>(  // Consumer로 상태 관리
        builder: (context, apiService, child) {
          if (apiService.posts.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: apiService.posts.length,  // apiService.posts로 게시글 목록
            itemBuilder: (context, index) {
              final post = apiService.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text("By ${post.author}"),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: post,
                  );
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 수정 버튼
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editPost(context, post),
                    ),
                    // 삭제 버튼
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deletePost(context, post.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createPost');  // 게시글 작성 페이지로 이동
        },
        child: Icon(Icons.add),
        tooltip: 'Create Post',
      ),
    );
  }
}
