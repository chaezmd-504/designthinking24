import 'package:designthinking/map/map_screen.dart';
import 'package:designthinking/map/waiting_number.dart';
import 'package:flutter/material.dart';
import 'map/hospital_screen.dart';
import 'map/rating_screen.dart';
import 'map/waiting_screen.dart';
import 'search/voice_recording_screen.dart';
import 'search/voice_screen.dart';
import 'symptom/detail_screen.dart';
import 'search/hand.dart';
import 'login/login_screen.dart';
import 'login/signup_screen.dart';
import 'home_screen.dart';
import 'symptom/symptom_screen.dart';
import 'login/user_repository.dart';
import 'community/community_screen.dart';
import 'profile_screen.dart';
import 'chat/chat_screen.dart';
import 'search/bodyparts.dart';
import 'symptom/symptom_screen2.dart';
import 'symptom/symptom_screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(userRepository: userRepository),
      routes: {
        '/login': (context) => LoginScreen(userRepository: userRepository),
        '/signup': (context) => SignupScreen(userRepository: userRepository),
        '/home': (context) => HomeScreen(),
        '/community': (context) => CommunityScreen(),
        '/profile': (context) => ProfileScreen(),
        '/chat': (context) => ChatListScreen(),
        '/symptom': (context) => SymptomScreen(),
        '/symptom2': (context) => SymptomScreen2(),
        '/detail': (context) => DetailScreen(),
        '/head': (context) => HeadScreen(),
        '/chest': (context) => ChestScreen(),
        '/arm': (context) => ArmScreen(),
        '/leg': (context) => LegScreen(),
        '/hand': (context) => HandScreen(),
        '/rating': (context) => RatingScreen(),
        '/distance': (context) => MapScreen(),
        '/waitingnumber': (context) => WaitingScreen(),
        '/waiting': ((context) => WaitingNumScreen()),
        '/hospital': ((context) => HospitalDetailPage()),
        '/voice': ((context) => VoiceScreen()),
        '/voicerecording': ((context) => VoiceRecordingScreen()),
        '/voicesymptom': ((context) => SymptomScreen3()),
      },
    );
  }
}
