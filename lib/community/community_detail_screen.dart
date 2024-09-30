import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityDetailScreen extends StatefulWidget {
  final String title;
  final String content;

  const CommunityDetailScreen({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  _CommunityDetailScreenState createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  final TextEditingController _commentController = TextEditingController();
  List<String> comments = [
    '디사2: \n헉, 그러게요.....',
    '&&& 의사 내과 전문의: \n안녕하세요! *병원의 전문의 &&&입니다. 인후염의 증상으로 의심이 됩니다. 따뜻한 물을 마시고 빠른 시일내에 병원을 방문하여 진료를 받으시길 바랍니다!'
  ];

  bool isFavorite = false;
  int favoriteCount = 1;

  void _submitComment() {
    final comment = _commentController.text;

    if (comment.isNotEmpty) {
      setState(() {
        comments.add('사용자: $comment');
      });
      _commentController.clear();
    }
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        favoriteCount++;
      } else {
        favoriteCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
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
                        'assets/logo.png',
                        height: 60,
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
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    color: Colors.orange.shade50,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/profile.jpg'),
                                radius: 20,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '강채원',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '32분 전',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '32분 전',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade700,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.content,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color:
                                      isFavorite ? Colors.pink : Colors.black,
                                  size: 16,
                                ),
                                onPressed: _toggleFavorite,
                              ),
                              SizedBox(width: 5),
                              Text('$favoriteCount'),
                              IconButton(
                                icon: Icon(
                                  Icons.comment,
                                  color: Colors.orange.shade700,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey.shade100,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(comments[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: '댓글을 입력하세요...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.orange.shade700),
                  onPressed: _submitComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
