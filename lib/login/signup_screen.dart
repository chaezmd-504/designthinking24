import 'package:flutter/material.dart';
import 'user_repository.dart';
import 'user.dart';

class SignupScreen extends StatefulWidget {
  final UserRepository userRepository;

  SignupScreen({required this.userRepository});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _signup() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password == confirmPassword) {
      widget.userRepository.addUser(User(email: email, password: password));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
    }
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
              padding: const EdgeInsets.symmetric(vertical: 15), // 상하 여백
              child: Image.asset(
                'assets/logo.png', // 로고 이미지 경로
                height: 60, // 로고 높이
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // 이 줄을 추가했습니다.
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: '아이디를 입력해주세요.'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '패스워드를 입력해주세요.'),
              obscureText: true,
            ),
            SizedBox(height: 15),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: '패스워드를 확인해주세요.'),
              obscureText: true,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _signup,
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
