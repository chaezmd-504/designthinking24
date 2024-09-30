import 'package:flutter/material.dart';

class HospitalDetailPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '정성정형외과의원',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '1.3km | 정형외과',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Divider(height: 32, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.phone, size: 30),
                    onPressed: () {
                      // 전화 기능 추가
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.web, size: 30),
                    onPressed: () {
                      // 웹사이트 링크 추가
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.location_on, size: 30),
                    onPressed: () {
                      // 지도 앱으로 위치 이동
                    },
                  ),
                ],
              ),
              Divider(height: 32, thickness: 1),
              Text(
                '경기 수원시 영통구 반달로35번길 30 아이파크 232~235,239~241,253~262호 (우)16705',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '진료마감\n월~금 09:00 ~ 19:00\n월~금 휴게시간 13:00 ~ 14:00',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'http://jungsung.or.kr/',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '031-205-8575',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/hospital1.png',
                        width: 200), // 병원 사진 경로를 설정하세요
                    SizedBox(width: 8),
                    Image.asset('assets/hospital2.png',
                        width: 200), // 병원 사진 경로를 설정하세요
                    SizedBox(width: 8),
                    Image.asset('assets/hospital3.png',
                        width: 200), // 병원 사진 경로를 설정하세요
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HospitalDetailPage(),
  ));
}
