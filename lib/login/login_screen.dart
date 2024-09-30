import 'package:flutter/material.dart';
import '../home_screen.dart';
import 'signup_screen.dart';
import 'user_repository.dart';
import 'user.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository;

  LoginScreen({required this.userRepository});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    var user = widget.userRepository.getUser(email, password);

    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('회원정보를 다시 확인해주세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png', // 로고 이미지 경로
                scale: 0.75,
              ),
              SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: '아이디'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: '패스워드'),
                obscureText: true,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: _login,
                child: Text('로그인'),
              ),
              //SizedBox(height: 20), // 로그인 버튼과 회원가입 버튼들 사이에 여백 추가
              ElevatedButton(
                onPressed: (_login),
                child: Text('회원가입'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(
                            userRepository: widget.userRepository,
                          ),
                        ),
                      );
                    },
                    child: Text('일반'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(
                            userRepository: widget.userRepository,
                          ),
                        ),
                      );
                    },
                    child: Text('의사'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
