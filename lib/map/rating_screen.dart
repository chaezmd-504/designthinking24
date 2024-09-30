import 'package:flutter/material.dart';
import 'waiting_screen.dart';

class Hospital {
  final String name;
  final double distance;
  final String address;
  final String imageUrl;
  final int starRating; // 별점을 저장하는 필드

  Hospital({
    required this.name,
    required this.distance,
    required this.address,
    required this.imageUrl,
    required this.starRating, // 생성자에 별점 추가
  });
}

class RatingScreen extends StatelessWidget {
  final List<Hospital> hospitals = [
    Hospital(
      name: '가톨릭정형외과의원',
      distance: 1.0,
      address: '서울특별시 강남구 테헤란로 456',
      imageUrl: 'assets/map_image.png',
      starRating: 5, // 별점 지정
    ),
    Hospital(
      name: '바른정형외과의원',
      distance: 1.0,
      address: '서울특별시 서초구 서초대로 789',
      imageUrl: 'assets/map_image.png',
      starRating: 4, // 별점 지정
    ),
    Hospital(
      name: '정성정형외과의원',
      distance: 0.7,
      address: '서울특별시 영등포구 당산로 123',
      imageUrl: 'assets/map_image.png',
      starRating: 3, // 별점 지정
    ),
  ];

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '목디스크',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateTo(context, '/distance'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // 버튼의 배경색을 빨간색으로 지정
                    // 기타 스타일을 필요에 따라 추가할 수 있습니다.
                  ),
                  child: Text(
                    '거리순',
                    style: TextStyle(
                      color: Colors.black, // 글씨색을 검정색으로 지정
                      // 기타 텍스트 스타일을 필요에 따라 추가할 수 있습니다.
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => _navigateTo(context, '/rating'),
                  child: Text('평점순'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => _navigateTo(context, '/orthopedic'),
                  child: Text('정형외과'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => _navigateTo(context, '/neurology'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // 버튼의 배경색을 빨간색으로 지정
                    // 기타 스타일을 필요에 따라 추가할 수 있습니다.
                  ),
                  child: Text(
                    '신경외과',
                    style: TextStyle(
                      color: Colors.black, // 글씨색을 검정색으로 지정
                      // 기타 텍스트 스타일을 필요에 따라 추가할 수 있습니다.
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                final hospital = hospitals[index];
                // 가톨릭정형외과 병원일 때만 번호표 버튼 없이 표시
                if (hospital.name == '가톨릭정형외과의원') {
                  return ListTile(
                    onTap: () =>
                        _navigateTo(context, '/hospital/${hospital.name}'),
                    title: Text('${index + 1}. ${hospital.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${hospital.distance}km'),
                        Row(
                          children: List.generate(hospital.starRating, (index) {
                            return Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            );
                          }),
                        ),
                        Text('${hospital.address}'),
                      ],
                    ),
                  );
                } else {
                  return ListTile(
                    onTap: () =>
                        _navigateTo(context, '/hospital/${hospital.name}'),
                    title: Text('${index + 1}. ${hospital.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${hospital.distance}km'),
                        Row(
                          children: [
                            ...List.generate(hospital.starRating, (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              );
                            }),
                            ...List.generate(5 - hospital.starRating, (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 20,
                              );
                            }),
                          ],
                        ),
                        Text('${hospital.address}'),
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () => _navigateTo(context, '/waitingnumber'),
                      child: Text('번호표'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
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
    );
  }
}
