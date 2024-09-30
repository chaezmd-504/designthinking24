import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 16.0),
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage('assets/profile_image.png'), // 프로필 이미지 경로
              ),
              SizedBox(height: 8.0),
              Text(
                '박성수',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'qocn0123@naver.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit),
                label: Text('내 정보'),
              ),
              Divider(thickness: 2.0),
              ListTile(
                title: Text('아이디'),
                subtitle: Text('qocn0123'),
              ),
              ListTile(
                title: Text('비밀번호 변경'),
                onTap: () {},
              ),
              ListTile(
                title: Text('이메일 변경'),
                onTap: () {},
              ),
              Divider(thickness: 2.0),
              ListTile(
                title: Text('이용 제한 내역'),
                onTap: () {},
              ),
              ListTile(
                title: Text('커뮤니티 이용규칙'),
                onTap: () {},
              ),
              Divider(thickness: 2.0),
              ListTile(
                title: Text('다크 모드'),
                trailing: Switch(
                  value: false,
                  onChanged: (bool value) {},
                ),
              ),
              ListTile(
                title: Text('알림 설정'),
                onTap: () {},
              ),
              ListTile(
                title: Text('암호 잠금'),
                onTap: () {},
              ),
            ],
          ),
        ],
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
