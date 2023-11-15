import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/ui/views/auth/onboarding/email_view.dart';
import 'package:vanilla/ui/views/auth/onboarding/otp_verification.dart';

class OnboardingViewModel extends BaseViewModel {
  final emailFormKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  String _otp = '';

  String get email => _authService.email;
  String get phoneNumber => _authService.phoneNumber;
  String get firstName => _authService.firstName;

  void goToEmail() {
    _navigationService.navigateToView(const EmailView());
  }

  void emailContinueFunction(BuildContext context) {
    if (emailFormKey.currentState!.validate()) {
      _authService.setEmail(emailController.text.trim());
      _navigationService.navigateTo(Routes.otpVerificationView,
          arguments: OTPVerificationArguments(type: 'email'));
    }
  }

  void otpContinueFunction(String type) {
    if (_otp.length == 4) {
      debugPrint('NEXT');
      if (type == 'email') {
        _navigationService.navigateTo(Routes.nameView);
      } else {
        _navigationService.navigateTo(Routes.setupView);
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

  void nameContinueFunction(BuildContext context) {
    if (emailFormKey.currentState!.validate()) {
      _authService.setAuthInfo(firstNameController.text.trim(),
          lastNameController.text.trim(), phoneNumberController.text.trim());
      rebuildUi();
      _navigationService.navigateTo(Routes.otpVerificationView,
          arguments: OTPVerificationArguments(type: 'phone'));
    }
  }

  setupFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithHomeView();
  }
}
