import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../map/map_screen.dart';
import 'recommendation_screen.dart';

class SymptomScreen extends StatelessWidget {
  final Map<String, List<Symptom>> symptoms = {
    '목이 아픔': [
      Symptom(
          name: '편도선염',
          description: '구체적인 증상: 고열, 오한, 인후통, 두통...',
          recommendation: '이비인후과',
          detailedDescription:
              '목의 통증: 편도선이 염증을 일으키면 일반적으로 목의 한쪽이나 양쪽에 통증이 발생합니다. \n 통증은 일반적으로 길고 신경질적일 수 있습니다. 인후통: 인후통은 일반적으로 목의 뒷부분이나 인후에서 느껴지는 통증으로 나타날 수 있습니다.\n열감: 편도선염은 종종 발열과 같은 열감을 유발할 수 있습니다. 이는 염증 반응의 일부로서 체온이 상승하는 것입니다.\n목의 붓기: 편도선이 염증을 일으키면 종종 목이 붓거나 부풀어 오를 수 있습니다.\n혓바닥의 홍조: 편도선염이 진행될수록 혓바닥이 붉게 변할 수 있습니다.\n구토 또는 두통: 일부 환자들은 편도선염으로 인한 구토나 두통과 같은 다른 증상을 경험할 수도 있습니다.'),
      Symptom(
          recommendation: '소화기 내과',
          name: '역류성 식도염',
          description: '구체적인 증상: 가슴 쓰림, 인후 통증...',
          detailedDescription: ''),
      Symptom(
          name: '목 디스크',
          description: '구체적인 증상: 어깨, 팔, 손 전체 통증...',
          recommendation: '신경외과, 정형외과',
          detailedDescription: ''),
    ],
    '눈이 충혈됨': [
      Symptom(
          name: '결막염',
          description: '구체적인 증상: 눈의 가려움, 분비물...',
          recommendation: '안과',
          detailedDescription: ''),
      // 다른 증상들 추가
    ],
    // 다른 검색어와 그에 따른 증상들 추가
  };

  @override
  Widget build(BuildContext context) {
    final String query = ModalRoute.of(context)!.settings.arguments as String;

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
