import 'package:vanilla/services/app_service.dart';
import 'package:vanilla/ui/bottom_sheets/action_warning/action_warning_sheet.dart';
import 'package:vanilla/ui/bottom_sheets/add_location/add_location_sheet.dart';
import 'package:vanilla/ui/bottom_sheets/confirm_price/confirm_price_sheet.dart';
import 'package:vanilla/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:vanilla/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:vanilla/ui/views/auth/onboarding/name_view.dart';
import 'package:vanilla/ui/views/auth/onboarding/otp_verification.dart';
import 'package:vanilla/ui/views/auth/onboarding/setup_view.dart';
import 'package:vanilla/ui/views/home/delivery/delivery_details_view.dart';
import 'package:vanilla/ui/views/home/delivery/delivery_summary_view.dart';
import 'package:vanilla/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/ui/views/auth/splash/splash_view.dart';
import 'package:vanilla/ui/views/auth/onboarding/onboarding_view.dart';
import 'package:vanilla/ui/views/auth/login/login_view.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/ui/views/profile/edit_profile.dart';
import 'package:vanilla/ui/views/profile/saved_locations.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: SplashView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OTPVerificationView),
    MaterialRoute(page: NameView),
    MaterialRoute(page: SetupView),
    MaterialRoute(page: DeliveryDetailsView),
    MaterialRoute(page: DeliverySummaryView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: SavedLocationsView),

// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: AppService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ConfirmPriceSheet),
    StackedBottomsheet(classType: ActionWarningSheet),
    StackedBottomsheet(classType: AddLocationSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
