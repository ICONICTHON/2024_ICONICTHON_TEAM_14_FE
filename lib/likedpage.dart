import 'package:flutter/material.dart';
import 'package:havruta_app/pages/havruta/havruta.dart';

import 'var.dart';

late List<Question> LikedHavruta;

class Likedpage extends StatefulWidget {
  @override
  _LikedPageState createState() => _LikedPageState();
}

class _LikedPageState extends State<Likedpage> {
  @override
  void initState() {
    super.initState();

    // LikedHavruta 초기화
    LikedHavruta = [];

    for (int i = 0; i < questions.length; i++) {
      if (questions[i].liked == true) {
        LikedHavruta.add(questions[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관심있는 질문'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: LikedHavruta.length, // LikedHavruta의 길이 사용
              itemBuilder: (context, index) {
                final question = LikedHavruta[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QADetailPage(question: question),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(question.title),
                      subtitle: Text(question.content),
                      trailing: Text(
                        question.status,
                        style: TextStyle(
                            color: question.status == '해결 완료'
                                ? Colors.green
                                : Colors.red),
                      ),
                      leading: question.imageUrl.isNotEmpty
                          ? Image.asset(question.imageUrl)
                          : Text(""),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
