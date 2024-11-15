import 'package:flutter/material.dart';

import 'likedpage.dart';
import 'pages/aboutLogin/before_login.dart';
import 'package:provider/provider.dart';
import 'api/api_service.dart'; // ApiService import
import 'pages/home_page.dart'; // 게시물 목록 페이지
import 'pages/https/detail_page.dart'; // 게시물 상세 페이지
import 'pages/aboutLogin/login_page.dart'; // 로그인 페이지
import 'pages/https/create_post_page.dart'; // 게시물 작성 페이지
import 'models/post.dart'; // Post 클래스를 가져옵니다.

import 'pages/aboutLogin/create_account.dart';
import 'pages/havruta/havruta.dart';
import 'pages/my_course.dart';
import 'pages/mypage.dart';
import 'pages/professor/professor_answer_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Havruta App',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: "동국체",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/createPost': (context) => CreatePostPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/mypage': (context) => MyPage(),
        '/course': (context) => MyCoursePage(),
        '/havruta': (context) => Havruta(),
        '/professor': (context) => ProfessorAnswerPage(),
        '/liked': (context) => Likedpage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final Post post = settings.arguments as Post;
          return MaterialPageRoute(
            builder: (context) => DetailPage(post: post),
          );
        }
        return null;
      },
      home: BeforeLogin(),
    );
  }
}
