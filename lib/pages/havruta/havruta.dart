import 'package:flutter/material.dart';
import 'havruta_write.dart';
import 'package:havruta_app/var.dart';
import 'package:havruta_app/var.dart';

int k = 0;

class Havruta extends StatefulWidget {
  @override
  _HavrutaState createState() => _HavrutaState();
}

class _HavrutaState extends State<Havruta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("동국대학교 하브루타"),
        backgroundColor: Color(0xffDB7223),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text("홈", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/course');
              },
              child: Text("수강 과목", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/havruta');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: Text("하브루타", style: TextStyle(color: Colors.black))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/professor');
              },
              child: Text("교수님 답변", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mypage');
              },
              child: Text("내 정보", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 300,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("질문 검색   "),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: TextField(),
                width: 600,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffDB7223),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1.8),
                ),
                child: TextButton(
                  onPressed: () async {
                    {
                      // 페이지로 이동하고 돌아올 때까지 대기
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HavrutaWrite()),
                      );
                      setState(() {});
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.message_sharp,
                        color: Colors.white,
                      ),
                      Text(
                        "질문 작성",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
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

class QADetailPage extends StatefulWidget {
  final Question question;

  QADetailPage({required this.question});

  @override
  _QADetailPageState createState() => _QADetailPageState();
}

class _QADetailPageState extends State<QADetailPage> {
  final TextEditingController comment1Controller = TextEditingController();
  final TextEditingController comment2Controller = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  bool showAnswerInput = false;
  @override
  void initState() {
    super.initState();
    k++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q&A Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.question.category} ${widget.question.professor} (${widget.question.status})',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 8.0),
              Text(
                'Q. ${widget.question.title}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.question.content,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              widget.question.imageUrl.isNotEmpty
                  ? Image.network(widget.question.imageUrl)
                  : Text(""),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up_off_alt_rounded),
                    onPressed: () {
                      widget.question.good = widget.question.good + 1;
                      setState(() {});
                      ();
                    },
                  ),
                  Text(':${widget.question.good}  '),
                  Icon(Icons.remove_red_eye_outlined),
                  Text('${widget.question.view + k}'),
                  IconButton(
                      onPressed: () {
                        widget.question.liked = widget.question.liked ^ true;
                        setState(() {});
                      },
                      icon: widget.question.liked
                          ? Icon(Icons.star)
                          : Icon(Icons.star_border)),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showAnswerInput = true;
                  });
                },
                child: Text("답변 작성"),
              ),
              Divider(),
              if (showAnswerInput)
                Column(
                  children: [
                    Text(
                      'A${answersComments.length + 1}. 새로운 답변',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: answerController,
                      decoration: InputDecoration(labelText: '답변을 작성하세요'),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        if (answerController.text.isNotEmpty) {
                          setState(() {
                            answerCount++;
                            answersComments.add([
                              Comment(
                                  content: answerController.text,
                                  parentid: widget.question.id)
                            ]);
                          });
                          answerController.clear();
                          setState(() {
                            showAnswerInput = false;
                          });
                        }
                      },
                      child: Text('답변 등록'),
                    ),
                  ],
                ),
              SizedBox(height: 16.0),

              // A1 댓글 작성란
              Text(
                'A1. 더 자세히 보여줄 수 있나요?',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18),

              ExpansionTile(
                title: Text(
                  '댓글 (${commentsA1.length})',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                children: commentsA1
                    .asMap()
                    .map((index, comment) => MapEntry(
                          index,
                          ListTile(
                            title: Text('댓글 ${index + 1}'),
                            subtitle: Text(comment.content),
                          ),
                        ))
                    .values
                    .toList(),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: comment1Controller,
                decoration: InputDecoration(labelText: '댓글을 작성하세요'),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  if (comment1Controller.text.isNotEmpty) {
                    final newComment = Comment(
                      content: comment1Controller.text,
                      parentid: widget.question.id,
                    );
                    setState(() {
                      commentsA1.add(newComment);
                    });
                    comment1Controller.clear();
                  }
                },
                child: Text('댓글 등록'),
              ),
              Text(
                'A2. 주파수는 어떻게 분석할 수 있나요?',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              ExpansionTile(
                title: Text(
                  '댓글 (${commentsA2.length})',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                children: commentsA2
                    .asMap()
                    .map((index, comment) => MapEntry(
                          index,
                          ListTile(
                            title: Text('댓글 ${index + 1}'),
                            subtitle: Text(comment.content),
                          ),
                        ))
                    .values
                    .toList(),
              ),
              TextField(
                controller: comment2Controller,
                decoration: InputDecoration(labelText: '댓글을 작성하세요'),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  if (comment2Controller.text.isNotEmpty) {
                    final newComment = Comment(
                      content: comment2Controller.text,
                      parentid: 2,
                    );
                    setState(() {
                      commentsA2.add(newComment);
                    });
                    comment2Controller.clear();
                  }
                },
                child: Text('댓글 등록'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String category;
  final String title;
  final String content;
  final String status;
  final String imageUrl;
  final int id;
  final String professor;
  int good;
  int view;
  bool liked;

  Question({
    required this.category,
    required this.title,
    required this.content,
    required this.status,
    required this.imageUrl,
    required this.id,
    required this.professor,
    required this.good,
    required this.view,
    required this.liked,
  });
}

class Comment {
  final String content;
  final int parentid;

  Comment({
    required this.content,
    required this.parentid,
  });
}
