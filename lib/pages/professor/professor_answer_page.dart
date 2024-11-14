import 'package:flutter/material.dart';
import 'package:havruta_app/pages/professor/professor_detail_page.dart';

class ProfessorAnswerPage extends StatefulWidget {
  @override
  _ProfessorAnswerPageState createState() => _ProfessorAnswerPageState();
}

class _ProfessorAnswerPageState extends State<ProfessorAnswerPage> {
  TextEditingController _searchController = TextEditingController();

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

  // 교수 목록 (대학별)
  Map<String, List<String>> professorsByUniversity = {
    '불교대학': ['김호성', '우제선', '신성현', '지창규', '고영섭'],
    '문과대학': [
      '이경철',
      '김환기',
      '송정현',
      '김대진',
      '강창일',
      '노헌균',
      '김성중',
      '홍승현',
      '황종연',
      '김상일'
    ],
    '이과대학': ['양우철', '정권범', '손정인', '조훈영', '이영섭', '안홍엽', '주용성', '박주현', '문환표'],
    '사회과학대학': ['김정석', '김상문', '김관호', '이경원', '안형택', '김종일', '황진태', '김용현'],
    '법과대학': ['강동욱', '이훈종', '변종필', '최봉석', '최창렬', '김도현', '오미영', '김경제'],
    '경찰사법대학': ['임준태', '최응렬', '조은경', '곽대경', '이창한', '조윤오', '이창배', '조영일'],
    '경영대학': ['이영면', '김승용', '최경규', '성상현', '김현동', '정구혁'],
    '바이오시스템대학': ['권영은', '김성민', '정종섭', '이수홍', '서영권', '김진식', '양승훈', '성정석'],
    '공과대학': [
      '김건욱',
      '김민성',
      '김삼동',
      '김성준',
      '김현석',
      '박강령',
      '박정동',
      '박현창',
      '류철',
      '이재훈'
    ],
    'AI융합대학': [
      '이철',
      '주종화',
      '이세준',
      '김동우',
      '김준태',
      '김지희',
      '박진호',
      '석문기',
      '선석규',
      '성연식',
      '손윤식',
      '이우진',
      '장혜령',
      '정영식',
      '정준호'
    ],
    '사범대학': ['윤선태', '황인규', '윤종필', '조건'],
    '약학대학': ['권경희', '한효경', '이창훈', '이경', '이무열', '정성훈', '김영우', '최원준'],
  };

  // 필터링된 교수 목록
  List<String> filteredProfessors = [];
  String? selectedUniversity = '불교대학'; // 기본값: 불교대학

  @override
  void initState() {
    super.initState();
    filteredProfessors =
        professorsByUniversity[selectedUniversity!]!; // 대학 선택 시 해당 교수 목록 초기화
  }

  // 대학 선택 시 해당 대학 교수 목록 필터링
  void _onUniversityChanged(String? newValue) {
    setState(() {
      selectedUniversity = newValue;
      filteredProfessors = professorsByUniversity[selectedUniversity!]!;
    });
  }

  // 교수 필터링
  void _filterProfessors() {
    setState(() {
      filteredProfessors = professorsByUniversity[selectedUniversity!]!
          .where((professor) =>
              professor.contains(_searchController.text)) // 검색어로 필터링
          .toList();
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
              child: Text("홈", style: TextStyle(color: Colors.white))),
          SizedBox(width: 30),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/course');
              },
              child: Text("수강 과목", style: TextStyle(color: Colors.white))),
          SizedBox(width: 30),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/havruta');
              },
              child: Text("하브루타", style: TextStyle(color: Colors.white))),
          SizedBox(width: 30),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/professor');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("교수님 답변", style: TextStyle(color: Colors.black))),
          SizedBox(width: 30),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mypage');
              },
              child: Text("내 정보", style: TextStyle(color: Colors.white))),
          SizedBox(width: 300),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            SizedBox(height: 20),
            // 검색창
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => _filterProfessors(), // 검색어 변경 시 필터링
                    decoration: InputDecoration(
                      hintText: '교수님 이름을 입력하세요',
                    ),
                  ),
                  width: 600,
                ),
                IconButton(
                  onPressed: _filterProfessors, // 돋보기 클릭 시 필터링
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: filteredProfessors
                    .map((professorName) => _buildProfessorListItem(
                        professorName, context)) // 필터링된 교수 목록 표시
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 교수 목록 항목
  Widget _buildProfessorListItem(String professorName, BuildContext context) {
    return ListTile(
      title: Text(professorName, style: TextStyle(fontSize: 18)),
      onTap: () {
        // 교수님 이름을 클릭했을 때 해당 교수님의 상세 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProfessorDetailPage(professorName: professorName)),
        );
      },
    );
  }
}
