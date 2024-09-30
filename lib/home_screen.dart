import 'package:designthinking/search/hand.dart';
import 'package:flutter/material.dart';

import 'map/map_screen.dart';
import 'map/rating_screen.dart';
import 'map/waiting_screen.dart';
import 'search/bodyparts.dart';
import 'chat/chat_screen.dart';
import 'community/community_screen.dart';
import 'symptom/detail_screen.dart';
import 'profile_screen.dart';
import 'symptom/symptom_screen.dart';
import 'chat/chatroom_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/symptom': (context) => SymptomScreen(),
        '/detail': (context) => DetailScreen(),
        '/home': (context) => HomeScreen(),
        '/community': (context) => CommunityScreen(),
        '/profile': (context) => ProfileScreen(),
        '/chat': (context) => ChatListScreen(),
        '/head': (context) => HeadScreen(),
        '/chest': (context) => ChestScreen(),
        '/arm': (context) => ArmScreen(),
        '/leg': (context) => LegScreen(),
        '/hand': (context) => HandScreen(),
        '/rating': (context) => RatingScreen(),
        '/distance': (context) => MapScreen(),
        '/waitingnumber': (context) => WaitingScreen(),
      },
      initialRoute: '/home',
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch() {
    String query = _searchController.text.toLowerCase();
    Navigator.pushNamed(
      context,
      '/symptom',
      arguments: query,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: Builder(
                builder: (context) => Row(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: '검색어를 입력하세요',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _onSearch,
                    ),
                    IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {
                        Navigator.pushNamed(context, '/voice');
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/human_body.png', // 사람 이미지 경로
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 20,
                    left: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/head');
                      },
                      child: Text(
                        '머리',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 70,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/chest');
                      },
                      child: Text(
                        '가슴',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 60,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/arm');
                      },
                      child: Text(
                        '팔',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    right: 60,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/arm');
                      },
                      child: Text(
                        '팔',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    left: 80,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/leg');
                      },
                      child: Text(
                        '다리',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

class Symptom {
  final String name;
  final String description;
  final String recommendation;
  final String detailedDescription;

  Symptom(
      {required this.name,
      required this.description,
      required this.recommendation,
      required this.detailedDescription});
}
