import 'package:flutter/material.dart';

class HandScreen extends StatefulWidget {
  @override
  _HandScreenState createState() => _HandScreenState();
}

class _HandScreenState extends State<HandScreen> {
  bool isSoreChecked = false;
  bool isTinglingChecked = false;
  bool isBurningChecked = false;
  bool isTightChecked = false;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 30, // 이미지 살짝 좌측으로 이동
                    child: Image.asset(
                      'assets/human_body_arm2.png',
                      width: 160, // 사람 이미지 경로
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    right: 50.0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSoreChecked = !isSoreChecked;
                                });
                              },
                              child: Text(
                                '쑤심',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Checkbox(
                              value: isSoreChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isSoreChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isTinglingChecked = !isTinglingChecked;
                                });
                              },
                              child: Text(
                                '저림',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Checkbox(
                              value: isTinglingChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isTinglingChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isBurningChecked = !isBurningChecked;
                                });
                              },
                              child: Text(
                                '쓰라림',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Checkbox(
                              value: isBurningChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isBurningChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isTightChecked = !isTightChecked;
                                });
                              },
                              child: Text(
                                '땡김',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Checkbox(
                              value: isTightChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isTightChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/symptom2');
              },
              child: Text('다음'),
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
