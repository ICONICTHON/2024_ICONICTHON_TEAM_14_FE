// 게시글 작성 및 수정 화면

import 'package:flutter/material.dart';
import '../models/post.dart';
import '../api/api_service.dart';

class CreatePostPage extends StatefulWidget {
  final Post? post; // 수정할 게시물

  CreatePostPage({Key? key, this.post}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _titleController.text = widget.post!.title;
      _contentController.text = widget.post!.content;
    }
  }

  void _submitPost() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      if (widget.post == null) {
        // 새로운 게시물 생성
        apiService.createPost(title, content);
      } else {
        // 기존 게시물 수정
        apiService.updatePost(widget.post!.id, title, content);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post == null ? "Create Post" : "Edit Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text(widget.post == null ? "Create" : "Update"),
            ),
          ],
        ),
      ),
    );
  }
}
