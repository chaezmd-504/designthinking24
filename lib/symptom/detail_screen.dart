import 'package:flutter/material.dart';
import '../home_screen.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Symptom symptom =
        ModalRoute.of(context)!.settings.arguments as Symptom;

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              symptom.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(symptom.detailedDescription),
            SizedBox(height: 20),
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
