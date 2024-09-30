import 'package:flutter/material.dart';

class VoiceRecordingScreen extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recording...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/voicesymptom');
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '00:10.19',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '목도 붓고 아프고 열도 나고 두통도 심하고\n콧물이 나지는 않은 것 같아서 ....',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
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
