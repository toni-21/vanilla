import 'package:stacked/stacked.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  Future runStartupLogic() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

     _navigationService.replaceWithHomeView();
    //_navigationService.replaceWithOnboardingView();
  }
}
