import 'package:flutter/material.dart';
import 'package:havruta_app/pages/professor/professor_detail_page.dart';

// 교수님 상세 페이지를 위한 import

class ProfessorAnswerPage extends StatelessWidget {
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
              child: Text("하브루타", style: TextStyle(color: Colors.white))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/professor');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: Text("교수님 답변", style: TextStyle(color: Colors.black))),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildProfessorListItem('김선주 교수님', context),
                  _buildProfessorListItem('김용훈 교수님', context),
                  _buildProfessorListItem('류철 교수님', context),
                  _buildProfessorListItem('박은찬 교수님', context),
                  _buildProfessorListItem('이유철 교수님', context),
                  _buildProfessorListItem('이기충 교수님', context),
                  _buildProfessorListItem('임민중 교수님', context),
                  _buildProfessorListItem('장진영 교수님', context),
                  _buildProfessorListItem('정화용 교수님', context),
                  _buildProfessorListItem('최지헌 교수님', context),
                  _buildProfessorListItem('홍영재 교수님', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
