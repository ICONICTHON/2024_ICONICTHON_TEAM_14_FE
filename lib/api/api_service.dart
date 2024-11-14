// API // HTTP 요청 코드 // API 통신 로직을 관리하는 파일
import 'package:flutter/material.dart';  // 이미 추가된 상태
import 'package:provider/provider.dart'; // 이 라인 추가

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/comment.dart';  // 댓글 모델 추가

// **수정된 부분**: ApiService가 ChangeNotifier를 extends하도록 변경
class ApiService extends ChangeNotifier {  // <-- 여기를 수정
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  // GET 요청을 보내는 메서드 (게시글 목록 불러오기)
  Future<void> fetchPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _posts = data.map((json) => Post.fromJson(json)).toList();
        notifyListeners();  // <-- notifyListeners()가 정상적으로 호출됩니다.
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      // **수정된 부분**: 오류 메시지에 더 명확한 설명 추가
      throw Exception('Error fetching posts: $e');
    }
  }

  // POST 요청을 보내는 메서드 (새로운 게시글 작성)
  Future<void> createPost(String title, String body) async {
    final url = Uri.parse('$baseUrl/posts');
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'title': title,
          'body': body,
          'userId': 1,  // 예시로 userId를 1로 설정
        }),
      );

      if (response.statusCode == 201) {
        print('Post created successfully');
      } else {
        // **수정된 부분**: 실패한 상태 코드 추가 출력
        print('Failed to create post: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // PUT 요청을 보내는 메서드 (게시글 수정)
  Future<void> updatePost(int postId, String title, String body) async {
    final url = Uri.parse('$baseUrl/posts/$postId');
    try {
      final response = await http.put(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'title': title,
          'body': body,
          'userId': 1,
        }),
      );

      if (response.statusCode == 200) {
        print('Post updated successfully');
      } else {
        // **수정된 부분**: 실패한 상태 코드 추가 출력
        print('Failed to update post: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // DELETE 요청을 보내는 메서드 (게시글 삭제)
  Future<void> deletePost(int postId) async {
    final url = Uri.parse('$baseUrl/posts/$postId');
    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        print('Post deleted successfully');
      } else {
        // **수정된 부분**: 실패한 상태 코드 추가 출력
        print('Failed to delete post: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // 댓글 추가 기능 (POST 요청)
  Future<void> addComment(int postId, String content) async {
    final url = Uri.parse('$baseUrl/comments');
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'postId': postId,
          'name': 'Anonymous',
          'email': 'anonymous@example.com',
          'body': content,
        }),
      );

      if (response.statusCode == 201) {
        print('Comment added successfully');
      } else {
        // **수정된 부분**: 실패한 상태 코드 추가 출력
        print('Failed to add comment: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
