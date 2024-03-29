import 'package:stacked/stacked.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/services/local_storage.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _prefs = locator<LocalStorage>();
  Future runStartupLogic() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    final user = await _prefs.getUser();
    if (user == null) {
      _navigationService.replaceWithOnboardingView();
    } else {
      _authService.setCurrentUser(user);
      _navigationService.replaceWithHomeView();
    }
  }
}
