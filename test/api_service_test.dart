import 'package:flutter_test/flutter_test.dart';
import '../lib/api/api_service.dart';  // 경로 수정: 'my_app' 폴더에서 api_service.dart를 가져옵니다.
import '../lib/models/post.dart';  // 경로 수정: 'my_app' 폴더에서 post.dart를 가져옵니다.

void main() {
  final apiService = ApiService();

  test('Fetch Posts test', () async {
    // fetchPosts 메서드가 List<Post>를 반환하도록 수정해야 합니다.
    await apiService.fetchPosts();
    final posts = apiService.posts; // apiService에서 posts를 가져옴
    expect(posts, isNotEmpty); // 빈 리스트가 아니어야 함
  });

  test('Create Post test', () async {
    // createPost 메서드가 void이므로 반환값을 체크하지 않음
    await apiService.createPost('Test Title', 'Test Body');
  });

  test('Update Post test', () async {
    // updatePost 메서드가 void이므로 반환값을 체크하지 않음
    await apiService.updatePost(1, 'Updated Title', 'Updated Body');
  });

  test('Delete Post test', () async {
    // deletePost 메서드가 void이므로 반환값을 체크하지 않음
    await apiService.deletePost(1);
  });
}
