import 'package:flutter/material.dart';
import 'feed.dart';
import 'community_detail_screen.dart';
import 'create_post_screen.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Map<String, dynamic>> posts = [
    {
      'title': '기침과 목아픔',
      'locationAndTime': '봉천동 · 6분 전',
      'content': '2주 전부터 잔기침을 하고, 침 삼킬 때 목이 아픈데... 뭘까요?? ㅠㅠㅠㅠㅠㅠㅠ',
      'field': '건강',
      'backgroundColor': 'FFFFFFFF',
    },
    {
      'title': '정성정형외과에 와서 편안한 진료 받으세요!',
      'locationAndTime': '영통동',
      'content': '최고의 의료진과 함께하는 정성정형외과에서 건강을 되찾으세요!',
      'field': '광고',
      'backgroundColor': 'FFA3B4FF'
    },
    {
      'title': '@@@ 병원',
      'locationAndTime': '봉천동 · 6분 전',
      'content': '아이가 새벽에 아파서 급하게 갔는데 늦은 시간에도 친절하고 좋아요~',
      'field': '추천',
      'backgroundColor': 'FFFFFFFF',
    },
    {
      'title': '졸려요..',
      'locationAndTime': '봉천동 · 6분 전',
      'content': '밥만 먹으면 너무너무 졸린데 이거 병원 가야하나요????????',
      'field': '일상',
      'backgroundColor': 'FFFFFFFF',
    },
  ];

  void _addNewPost(Map<String, dynamic> post) {
    setState(() {
      posts.insert(0, post);
    });
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
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/logo.png', // 로고 이미지 경로
                        height: 60, // 로고 높이
                      ),
                    ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10), // 빈 공간 추가
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  '    영통동  ',
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
                Spacer(), // 나머지 공간을 채우기 위해 Spacer 추가
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu_rounded, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_rounded, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: posts.map((post) {
                  return Feed(
                    title: post['title']!,
                    locationAndTime: post['locationAndTime']!,
                    price: post['content']!,
                    field: post['field']!,
                    backgroundColor:
                        Color(int.parse(post['backgroundColor']!, radix: 16)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityDetailScreen(
                            title: post['title']!,
                            content: post['content']!,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostScreen(),
            ),
          );
          if (newPost != null) {
            _addNewPost({
              'title': newPost['title'],
              'locationAndTime': '방금',
              'content': newPost['content'],
              'field': newPost['field'],
              'backgroundColor': 'FFFFFFFF', // Default white color
            });
          }
        },
        backgroundColor: Color.fromARGB(255, 83, 111, 238), //
        child: Icon(Icons.edit),
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
