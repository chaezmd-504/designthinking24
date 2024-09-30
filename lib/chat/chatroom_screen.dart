import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  final int chatRoomId;

  ChatRoomScreen({required this.chatRoomId});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: message['isDoctor']
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        if (message['isDoctor'])
                          CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: message['isDoctor']
                                  ? Colors.grey[200]
                                  : Colors.blue[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              message['text'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        if (!message['isDoctor']) SizedBox(width: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (messages.last.containsKey('isRatingRequest') &&
                messages.last['isRatingRequest'])
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text('상담이 친절했다면 평점을 매겨주세요 :)'),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.yellow[600],
                        );
                      }),
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

  final List<Map<String, dynamic>> messages = [
    {
      'isDoctor': true,
      'text': '이비인후과 전문의 박성수입니다. 이비인후과 관련 질문을 남겨주시면 빠른 시일내로 답변해드리겠습니다.',
    },
    {
      'isDoctor': false,
      'text':
          '제가 지금 몇 일째 기침을 하고 있는데 병원을 가봐야할까요? 기침하는 것 외에 열이나 콧물 이런 증상은 없는 것 같아요.',
    },
    {
      'isDoctor': true,
      'text':
          '목감기 중에 기침으로만 증상이 시작되었다가 감기가 악화되는 경우가 있습니다. 가까운 병원이나 혹은 이비인후과 방문을 추천드립니다.',
    },
    {
      'isDoctor': false,
      'text':
          '감사합니다! 내일 당장 일이 있어서 병원을 못 갈 것 같은데, 집에서 증상을 완화 시키기 위한 좋은 방법 없을까요?',
    },
    {
      'isDoctor': true,
      'text': '따뜻한 차를 마시고 수분섭취를 많이 하시는 것을 추천드립니다. 또한 무리한 발작 자극적인 음식은 피해주세요.',
    },
    {
      'isDoctor': false,
      'text': '감사합니다!',
    },
    {
      'isDoctor': true,
      'text': '상담이 친절했다면 평점을 매겨주세요 :)',
      'isRatingRequest': true,
    },
  ];
}
