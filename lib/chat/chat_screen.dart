import 'package:flutter/material.dart';

import 'chatroom_screen.dart';

class ChatListScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: '의사 박성수',
      rating: 5.0,
      hospital: '성수병원',
      specialty: '이비인후과 전문의',
      credentials: [
        '서울대학교 의과대학 졸업',
        '전 서울대학교 교수',
        '현 성수병원 원장',
      ],
      responseRate: '90%',
      imageUrl: 'assets/doctor1.png',
    ),
    Doctor(
      name: '의사 김민수',
      rating: 4.8,
      hospital: '강남병원',
      specialty: '내과 전문의',
      credentials: [
        '고려대학교 의과대학 졸업',
        '전 강남병원 부교수',
        '현 강남병원 과장',
      ],
      responseRate: '85%',
      imageUrl: 'assets/doctor2.png',
    ),
    Doctor(
      name: '의사 이정훈',
      rating: 4.9,
      hospital: '연세병원',
      specialty: '소아과 전문의',
      credentials: [
        '연세대학교 의과대학 졸업',
        '전 연세병원 교수',
        '현 연세병원 원장',
      ],
      responseRate: '92%',
      imageUrl: 'assets/doctor3.png',
    ),
    Doctor(
      name: '의사 최영희',
      rating: 4.7,
      hospital: '서울대병원',
      specialty: '피부과 전문의',
      credentials: [
        '서울대학교 의과대학 졸업',
        '전 서울대병원 교수',
        '현 서울대병원 원장',
      ],
      responseRate: '88%',
      imageUrl: 'assets/doctor4.png',
    ),
  ];
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                Text(
                  '영통동',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:
                                    100, // Set the width according to your requirement
                                height:
                                    120, // Set the height according to your requirement
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(doctor.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctor.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      doctor.specialty,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700]),
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      doctor.hospital,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        doctor.rating.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.star,
                                          size: 20, color: Colors.amber),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '답변률: ${doctor.responseRate}',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(thickness: 1.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        doctor.credentials.map((credential) {
                                      return Text('• $credential');
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChatRoomScreen(chatRoomId: index),
                                  ),
                                );
                              },
                              child: Text('1:1 문의하기'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
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

class Doctor {
  final String name;
  final double rating;
  final String hospital;
  final String specialty;
  final List<String> credentials;
  final String responseRate;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.rating,
    required this.hospital,
    required this.specialty,
    required this.credentials,
    required this.responseRate,
    required this.imageUrl,
  });
}
