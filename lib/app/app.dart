import 'package:vanilla/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:vanilla/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:vanilla/ui/views/home/home_view.dart';
import 'package:vanilla/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/ui/views/auth/splash/splash_view.dart';
import 'package:vanilla/ui/views/auth/onboarding/onboarding_view.dart';
import 'package:vanilla/ui/views/auth/login/login_view.dart';
import 'package:vanilla/services/auth_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SplashView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
