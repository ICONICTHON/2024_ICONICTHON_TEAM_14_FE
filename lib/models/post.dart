class Post {
  final int id;
  final String title;
  final String body;
  final int userId;
  final String author;  // 'author' 추가
  final DateTime createdAt;  // 'createdAt' 추가

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.author,  // 'author' 초기화
    required this.createdAt,  // 'createdAt' 초기화
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      author: json['author'] ?? 'Unknown',  // 기본값 'Unknown' 설정
      createdAt: DateTime.parse(json['createdAt']),  // 문자열을 DateTime으로 파싱
    );
  }
  String get content => body;
}
