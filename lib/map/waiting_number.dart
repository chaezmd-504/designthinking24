import 'package:flutter/material.dart';

class WaitingNumScreen extends StatelessWidget {
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
      bottomNavigationBar: Container(
        height: 84.0,
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20), // 상단 여백 추가
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/waitingimage.png', // 티켓 배경 이미지 경로를 설정하세요
                    width: 320,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Text(
                        '13',
                        style: TextStyle(
                          fontSize: 100,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '번째',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 35),
                      Text(
                        '정성정형외과의원',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '내 대기번호 : 153',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/waitingnumber');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 110, 180, 255),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text('대기 취소'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
