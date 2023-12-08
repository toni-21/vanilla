import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/services/auth_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  void goToSavedLocation() {
    _navigationService.navigateTo(Routes.savedLocationsView);
  }

  void goToEditProfile() {
    _navigationService.navigateTo(Routes.editProfileView);
  }
}
