import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.dialogs.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/models/response/user.dart';
import 'package:vanilla/services/api_service.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/services/local_storage.dart';
import 'package:vanilla/ui/views/auth/onboarding/email_view.dart';
import 'package:vanilla/ui/views/auth/onboarding/otp_verification.dart';
import 'package:vanilla/utilities/function_helpers/printf.dart';

class OnboardingViewModel extends BaseViewModel {
  final emailFormKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();
  final _prefs = locator<LocalStorage>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  String _otp = '';

  String get email => _authService.currentUser.email ?? '';
  String get phoneNumber => _authService.currentUser.phoneNumber ?? '';
  String get firstName => _authService.firstName;

  void goToEmail() {
    _navigationService.navigateToView(const EmailView());
  }

  void emailContinueFunction(BuildContext context) {
    if (emailFormKey.currentState!.validate()) {
      signup(email: emailController.text.trim());
    }
  }

  void getOtp() {
    printf("GENERATED OTP - ${_authService.authOtp}");
  }

  void signup({
    required String email,
  }) async {
    setBusy(true);
    final response = await _apiService.auth.checkIfUserExists(email: email);
    if (response == null) {
      printf('somthings wrong with entry');
    } else if (response == false) {
      //new user
      printf('new user');
      final newUser = await _apiService.auth.createUser(email: email);
      if (newUser != null) {
        _authService.setCurrentUser(newUser);
        notifyListeners();
        _navigationService.navigateTo(Routes.otpVerificationView,
            arguments: OTPVerificationArguments(type: 'email'));
      }
    } else {
      //returning user
      printf('returning user');
      final user = await _apiService.auth.getUser(documentId: response);
      if (user != null) {
        _authService.setCurrentUser(user);
        notifyListeners();
        _prefs.setUser(user);
        _navigationService.replaceWithHomeView();
      }
    }
    setBusy(false);
  }

  void otpContinueFunction(String type) {
    if (_otp.length == 4) {
      printf('NEXT');
      //check if otp is correct
      if (_otp == _authService.authOtp) {
        if (type == 'email') {
          _navigationService.navigateTo(Routes.nameView);
        } else {
          _navigationService.navigateTo(Routes.setupView);
        }
      } else {
        otpController.clear();
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'Wrong OTP',
          description: 'Please input the correct OTP',
        );
      }
    }
  }

  void setOtp(String otp, {required String type}) {
    _otp = otp;
    if (otp != '') {
      rebuildUi();
    }
    otpContinueFunction(type);
  }

  void nameContinueFunction(BuildContext context) async {
    if (emailFormKey.currentState!.validate()) {
      setBusy(true);
      final user = await _apiService.auth.updateUser(
          model: UserModel(
              documentId: _authService.currentUser.documentId,
              email: _authService.currentUser.email,
              firstName: firstNameController.text.trim(),
              lastName: lastNameController.text.trim(),
              phoneNumber: phoneNumberController.text.trim()));
      if (user != null) {
        _authService.setCurrentUser(user);
        _prefs.setUser(user);
        rebuildUi();
        _navigationService.navigateTo(Routes.otpVerificationView,
            arguments: OTPVerificationArguments(type: 'phone'));
      }
    }
    setBusy(false);
  }

  setupFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithHomeView();
  }
}
