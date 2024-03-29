import 'package:vanilla/models/response/user.dart';

class AuthService {
  UserModel? _currentUser;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _authOtp;

  UserModel get currentUser => _currentUser ?? UserModel();
  String get email => _email ?? '';
  String get phoneNumber => _phoneNumber ?? '';
  String get lastName => _lastName ?? '';
  String get firstName => _firstName ?? '';
  String? get authOtp => _authOtp;

  void setCurrentUser(UserModel? user) {
    _currentUser = user;
  }

  void setEmail(String value) {
    _email = value;
  }

  void setAuthInfo(String firstName, String lastName, String phoneNumber) {
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
  }

  void setOtp(String value) {
    _authOtp = value;
  }
}
