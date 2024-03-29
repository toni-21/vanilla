import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.bottomsheets.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/models/body/action_warning.dart';
import 'package:vanilla/models/response/user.dart';
import 'package:vanilla/services/auth_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final newLocationController = TextEditingController();
  final landmarkController = TextEditingController();

  UserModel get user => _authService.currentUser;

  void goToSavedLocation() {
    _navigationService.navigateTo(Routes.savedLocationsView);
  }

  void goToEditProfile() {
    _navigationService.navigateTo(Routes.editProfileView);
  }

  void showDeleteLocationBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.actionWarning,
      title: 'Delete Location',
      description: 'Are you sure you want to delete this location?',
      data: ActionWarningModel(
          description: 'No 10 Acme Road, Ikeja',
          cancelText: 'Cancel',
          acceptText: 'Delete',
          onPressed: () {},
          onCancel: () {}),
    );
  }

  void showLogoutBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.actionWarning,
      title: 'Log Out',
      description: 'Are you sure you want to log out from your app?',
      data: ActionWarningModel(
          cancelText: 'Yes, I want to log out',
          acceptText: 'Cancel',
          onPressed: () {},
          onCancel: () {}),
    );
  }

  void showAddLocationBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addLocation,
    );
  }
}
