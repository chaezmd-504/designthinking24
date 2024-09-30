import 'package:designthinking/map/map_screen.dart';
import 'package:flutter/material.dart';
import '../home_screen.dart';
import 'recommendation_screen.dart';

class SymptomScreen2 extends StatelessWidget {
  final Map<String, List<Symptom>> symptoms = {
    '팔이 저림': [
      Symptom(
          name: '목 디스크',
          description: '구체적인 증상: 어깨, 팔, 손 전체 통증...',
          recommendation: '신경외과, 정형외과',
          detailedDescription: ''),
      Symptom(
          name: '흉곽출구증후군',
          description: '구체적인 증상: 팔의 저림, 손가락의 마비...',
          recommendation: '정형외과',
          detailedDescription: ''),
    ],
    // 다른 검색어와 그에 따른 증상들 추가
  };

  @override
  Widget build(BuildContext context) {
    const String query = '팔이 저림';

    List<Symptom> getSymptomList(String query) {
      if (symptoms.containsKey(query)) {
        return symptoms[query]!;
      } else {
        return [];
      }
    }

    List<Symptom> symptomList = getSymptomList(query);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // 두 배 크기 (56 * 2)
        child: AppBar(
          automaticallyImplyLeading: false, // 기본 leading 제거
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0), // 상하 여백
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  Image.asset(
                    'assets/logo.png', // 로고 이미지 경로
                    height: 60, // 로고 높이
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        // 사이드 메뉴 내용
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Navigate to item 1
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Navigate to item 2
              },
            ),
          ],
        ),
      ),
      body: symptomList.isNotEmpty
          ? ListView.builder(
              itemCount: symptomList.length * 2,
              itemBuilder: (context, index) {
                if (index.isEven) {
                  // 병명과 구체적인 증상 표시
                  final symptom = symptomList[index ~/ 2];
                  return SymptomCard(symptom: symptom);
                } else {
                  // 진료과 추천 표시
                  final symptom = symptomList[(index - 1) ~/ 2];
                  return RecommendationCard(
                      recommendation: symptom.recommendation);
                }
              },
            )
          : Center(
              child: Text('검색어에 맞는 정보를 찾을 수 없습니다.'),
            ),
      bottomNavigationBar: Container(
        height: 84.0, // 1.5배 크기 (56 * 1.5)
        child: BottomNavigationBar(
          selectedItemColor: Colors.black, // 선택된 아이템 색상
          unselectedItemColor: Colors.black, // 선택되지 않은 아이템 색상
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/community');
                break;
              case 1:
                Navigator.pushNamed(context, '/home');
                break;
              case 2:
                Navigator.pushNamed(context, '/chat');
                break;
            }
          },
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final Symptom symptom;

  SymptomCard({required this.symptom});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: symptom,
        );
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                symptom.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(symptom.description),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String recommendation;

  RecommendationCard({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '진료과 추천: $recommendation',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
