import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/services/api_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  void signup({
    required String email,
    required String password,
    required String name,
  }) async {
    setBusy(true);
    final response = await _apiService.register(email, password, name);
    setBusy(false);
    if (response != null) {
      debugPrint('registration successful');
      _navigationService.navigateTo(Routes.homeView);
    }
  }
}
