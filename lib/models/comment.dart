class Comment {
  final int id;           // 댓글 ID
  final String content;    // 댓글 내용
  final String author;     // 댓글 작성자
  final DateTime createdAt; // 생성일

  Comment({
    required this.id,
    required this.content,
    required this.author,
    required this.createdAt,
  });

  // JSON 데이터를 Comment 객체로 변환
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      author: json['author'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Comment 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'author': author,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
