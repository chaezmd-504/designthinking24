import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();

  void _submitPost() {
    final title = _titleController.text;
    final content = _contentController.text;
    final field = _fieldController.text;

    if (title.isNotEmpty && content.isNotEmpty && field.isNotEmpty) {
      // Default background color is white
      final backgroundColor = Colors.white;

      // Pass the new post data back to the previous screen
      Navigator.pop(context, {
        'title': title,
        'content': content,
        'field': field,
        'backgroundColor': backgroundColor.value.toRadixString(16),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // 두 배 크기 (56 * 2)
        child: AppBar(
          automaticallyImplyLeading: false, // 기본 leading (뒤로가기 버튼) 사용
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0), // 상하 여백
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: '제목',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: '내용',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _fieldController,
              decoration: InputDecoration(
                labelText: '분야',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('업로드'),
            ),
          ],
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
    );
  }
}
