import 'user.dart';

class UserRepository {
  List<User> _users = [];

  // 생성자 추가하여 초기 사용자 설정
  UserRepository() {
    // 초기 사용자 생성 및 추가
    User initialUser = User(email: 'a', password: 'a');
    addUser(initialUser);
  }

  void addUser(User user) {
    _users.add(user);
  }

  User? getUser(String email, String password) {
    try {
      return _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  List<User> get users => _users;
}
