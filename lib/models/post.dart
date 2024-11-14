import 'comment.dart';

class Post {
  final int id; // 게시물 ID
  final String title; // 게시물 제목
  final String content; // 게시물 내용
  final String author; // 작성자 이름
  final DateTime createdAt; // 생성일
  final List<Comment> comments; // 댓글 목록

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
    this.comments = const [],
  });

  // JSON 데이터를 Post 객체로 변환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      createdAt: DateTime.parse(json['createdAt']),
      comments: (json['comments'] as List<dynamic>)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
    );
  }

  // Post 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'createdAt': createdAt.toIso8601String(),
      'comments': comments.map((comment) => comment.toJson()).toList(),
    };
  }
}
