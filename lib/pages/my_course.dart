import 'package:flutter/material.dart';

import '../var.dart';
import 'havruta/havruta.dart';

// 질문 객체 클래스
class Question {
  final String title;
  final String content;

  Question({required this.title, required this.content});
}

// 질문 상세 페이지
class QuestionDetailPage extends StatelessWidget {
  final Question question;

  QuestionDetailPage({required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("질문 상세"),
        backgroundColor: Color(0xffDB7223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              question.content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCoursePage extends StatefulWidget {
  @override
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  // 대학 목록
  List<String> universities = [
    '불교대학',
    '문과대학',
    '이과대학',
    '법과대학',
    '사회과학대학',
    '경찰사법대학',
    '경영대학',
    '바이오시스템대학',
    '공과대학',
    'AI융합대학',
    '사범대학',
    '약학대학',
  ];

  // 과목과 해당 과목의 질문 제목과 내용 관리
  Map<String, Map<String, List<Question>>> courseQuestions = {
    '불교대학': {
      '인도의 철학과 문화': [
        Question(
          title: '업과 윤회',
          content:
              '인도의 고대 철학에서 "업"(Karma)과 "윤회"(Samsara)의 개념은 어떻게 상호작용하며 인간 존재에 영향을 미칩니까?',
        ),
        Question(
          title: '베다와 우파니샤드',
          content:
              '베다(Veda)와 우파니샤드(Upanishad)에서의 철학적 사고가 인도의 문화와 사회적 구조에 어떤 영향을 미쳤습니까?',
        ),
      ],
      '선의 이해': [
        Question(
          title: '직지인심',
          content: '선불교에서 "직지인심"(直指人心)이란 무엇을 의미하며, 이를 실천하기 위한 방법은 무엇입니까?',
        ),
        Question(
          title: '여타 종교와의 차이점',
          content: '선(禅)의 "즉각적 깨달음" 개념은 다른 불교 종파의 깨달음 개념과 어떻게 다릅니까?',
        ),
      ],
      '불교 교단사': [
        Question(
          title: '교단의 조직 구조',
          content: '초기 불교 교단의 조직 구조는 어떻게 형성되었으며, 이를 통해 당시 사회에 미친 영향은 무엇입니까?',
        ),
        Question(
          title: '대승불교의 출현',
          content: '대승불교의 출현과 그로 인한 교단 내 변화를 설명해 주세요.',
        ),
      ],
      '고전 요가': [
        Question(
          title: '8단계 요가',
          content: '파탄잘리의 요가 수트라에서 제시된 "8단계 요가"는 현대 요가 실천에 어떤 영향을 미쳤습니까?',
        ),
        Question(
          title: '명상의 영향',
          content: '고전 요가의 "명상"이 신체 건강과 정신적 평화에 미치는 영향에 대해 어떻게 설명할 수 있습니까?',
        ),
      ],
      '아비달마': [
        Question(
          title: '5음',
          content: '아비달마 교리에서의 "5음" 개념은 무엇이며, 그것이 인간 경험을 어떻게 설명하는지 설명해 주세요.',
        ),
        Question(
          title: '사성제와 팔정도',
          content: '아비달마가 제시하는 "사성제"와 "팔정도"의 해석에서의 차이를 설명해 주세요.',
        ),
      ],
      '중국 선사상': [
        Question(
          title: '좌선의 중요성',
          content: '중국 선불교에서 "좌선"의 중요성과 그가 제시하는 명상 방법에 대해 설명해 주세요.',
        ),
        Question(
          title: '무문관',
          content: '중국 선사상에서의 "무문관"(無門關)과 그것이 가진 철학적 의미를 어떻게 이해할 수 있습니까?',
        ),
      ],
    },
  };

  String? selectedUniversity = '불교대학'; // 기본값: 불교대학
  String? selectedCourse; // 선택된 과목

  @override
  void initState() {
    super.initState();
    selectedCourse =
        courseQuestions[selectedUniversity!]!.keys.first; // 기본값: 첫 번째 과목
  }

  // 대학 선택 시 해당 대학 과목 목록 필터링
  void _onUniversityChanged(String? newValue) {
    setState(() {
      selectedUniversity = newValue;
      selectedCourse = courseQuestions[selectedUniversity!]!
          .keys
          .first; // 새 대학에 맞는 첫 번째 과목을 선택
    });
  }

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
            child: Text("홈", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/course');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Text("수강 과목", style: TextStyle(color: Colors.black)),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/havruta');
            },
            child: Text("하브루타", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/professor');
            },
            child: Text("교수님 답변", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/mypage');
            },
            child: Text("내 정보", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 300),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              // 대학 선택 Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('대학 선택: ', style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    value: selectedUniversity,
                    onChanged: _onUniversityChanged,
                    items: universities
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 80),
              // 내 수강 과목 헤더
              Container(
                padding: EdgeInsets.all(16),
                color: Color(0xffDB7223),
                child: Column(
                  children: [
                    Text(
                      "내 수강 과목",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // 과목명 선택 리스트
              Column(
                children:
                    courseQuestions[selectedUniversity!]!.keys.map((course) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCourse = course;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.orange[100],
                      child: Text(
                        course,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              // 선택된 과목에 해당하는 질문 목록
              if (selectedCourse != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "질문 제목",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    ...courseQuestions[selectedUniversity]![selectedCourse!]!
                        .map((question) {
                      return ListTile(
                        title: Text(question.title),
                        onTap: () {
                          // 질문 제목을 클릭했을 때 상세 페이지로 이동
                          for (int i = 0; i < 14; i++) {
                            if (question.title == questions[i].title) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QADetailPage(
                                    question: questions[i],
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      );
                    }).toList(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
