class AuthService {
  String? _email;

  String get email => _email ?? '';

  void setEmail(String value) {
    _email = value;
  }
}
