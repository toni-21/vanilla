import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/ui/views/auth/onboarding/email_view.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();

  void goToEmail() {
    debugPrint('ass');
    _navigatorService.navigateToView(const EmailView());
  }
}
