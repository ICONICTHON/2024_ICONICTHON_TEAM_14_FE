import 'package:flutter/material.dart';

List<String> professorList = [
  '김선주 교수님',
  '김용훈 교수님',
  '류철 교수님',
  '박은찬 교수님',
  '이유철 교수님',
  '이기충 교수님',
  '임민중 교수님',
  '장진영 교수님',
  '정화용 교수님',
  '최지헌 교수님',
  '홍영재 교수님',
  '송수환 교수님'
];

List<String> subjectList = [
  '시스템 소프트워어',
  '웹 프로그래밍',
  '알고리즘',
  '컴퓨터구성',
  '객체지향프로그래밍',
  '기초 프로그래밍',
  '딥러닝 입문',
  '자료구조',
  '공학경제',
  '어드벤처디자인',
  '캡스톤 디자인',
  '프로그래밍 언어론'
];

class HavrutaWrite extends StatefulWidget {
  @override
  _HavrutaWriteState createState() => _HavrutaWriteState();
}

class _HavrutaWriteState extends State<HavrutaWrite> {
  final TextEditingController professorController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  List<Item> _data = generateItems();
  int? selectedProfessorIndex;
  List<String>? subjects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDB7223),
        title: Text("질문 작성"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                // 교수님 목록을 펼쳐놓기 위한 ExpansionPanelList
                ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.all(0),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                            '교수님',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      body: Column(
                        children: professorList
                            .asMap()
                            .entries
                            .map((entry) => ListTile(
                                  title: Text(entry.value),
                                  onTap: () {
                                    setState(() {
                                      professorController.text = entry.value;
                                      selectedProfessorIndex = entry.key;
                                      // 해당 교수님에 대한 과목을 설정합니다.
                                      subjects = [
                                        professorList[entry.key],
                                        professorList[entry.key + 1]
                                      ];
                                      // 교수님 선택 후, 교수님 목록을 닫습니다.
                                      _data[0].isExpanded = false;
                                      // 과목 목록을 펼칩니다.
                                      _data[1].isExpanded = true;
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                      isExpanded: _data[0].isExpanded,
                    ),
                  ],
                ),
                ListTile(
                  title: Text("선택된 교수님: ${professorController.text}"),
                ),
                // 교수님이 선택된 후, 과목 목록을 표시합니다.
                if (selectedProfessorIndex != null && subjects != null)
                  ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: EdgeInsets.all(0),
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              '담당 과목',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                        body: Column(
                          children: subjects!
                              .map((subject) => ListTile(
                                    title: Text(subject),
                                    onTap: () {
                                      setState(() {
                                        subjectController.text = subject;
                                        // 과목 선택 후, 과목 목록을 닫습니다.
                                        _data[1].isExpanded = false;
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                        isExpanded: _data[1].isExpanded,
                      ),
                    ],
                  ),
                ListTile(
                  title: Text("선택된 과목: ${subjectController.text}"),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: 600,
                child: TextField(
                  decoration: InputDecoration(labelText: "제목"),
                ),
              ),
              Container(
                width: 600,
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.8,
                    color: Colors.grey,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "내용",
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.white,
                  maxLines: 20,
                  maxLength: null,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "전송",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffDB7223)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.isExpanded,
  });

  String expandedValue;
  bool isExpanded;
}

List<Item> generateItems() {
  return [
    Item(
      expandedValue: '교수님 목록',
      isExpanded: true, // 교수님 목록은 처음에 펼쳐져 있어야 합니다.
    ),
    Item(
      expandedValue: '담당 과목 목록',
      isExpanded: false, // 과목 목록은 기본적으로 닫혀 있습니다.
    ),
  ];
}
