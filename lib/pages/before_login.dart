import 'dart:async';

import 'package:flutter/material.dart';

class BeforeLogin extends StatefulWidget {
  @override
  _BeforeLoginState createState() => _BeforeLoginState();
}

class _BeforeLoginState extends State<BeforeLogin> {
  @override
  void initState() {
    super.initState();
    // 2초 뒤 화면 이동
    Timer(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, "/login");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 102, 29, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/hbrewta.jpg"),
              ],
            ),
          ),
          Text(
            "동국\n하브루타",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 34,
            ),
          ),
        ],
      ),
    );
  }
}
