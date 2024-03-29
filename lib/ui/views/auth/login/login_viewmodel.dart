import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/services/api_service.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/ui/views/auth/onboarding/otp_verification.dart';
import 'package:vanilla/utilities/function_helpers/printf.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  final _authService = locator<AuthService>();

  void signup({
    required String email,
  }) async {
    setBusy(true);
    final response = await _apiService.auth.checkIfUserExists(email: email);
    if (response == null) {
      printf('somthings wrong with entry');
    } else if (response == false) {
      //new user
      final newUser = await _apiService.auth.createUser(email: email);
      _navigationService.navigateTo(Routes.otpVerificationView,
          arguments: OTPVerificationArguments(type: 'email'));
    } else {
      //returning user
      final user = await _apiService.auth.getUser(documentId: response);
      _authService.setCurrentUser(user);
      notifyListeners();

      _navigationService.replaceWithHomeView();
    }
    setBusy(false);
    if (response != null) {
      printf('registration successful');
      _navigationService.navigateTo(Routes.homeView);
    }
  }
}
