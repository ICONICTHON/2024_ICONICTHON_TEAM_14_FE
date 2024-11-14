import 'package:flutter/material.dart';
import 'pages/before_login.dart';
import 'package:provider/provider.dart';
import 'api/api_service.dart'; // ApiService import
import 'pages/home_page.dart'; // 게시물 목록 페이지
import 'pages/detail_page.dart'; // 게시물 상세 페이지
import 'pages/login_page.dart'; // 로그인 페이지
import 'pages/create_post_page.dart'; // 게시물 작성 페이지
import 'models/post.dart'; // Post 클래스를 가져옵니다.

import 'pages/create_account.dart';

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
