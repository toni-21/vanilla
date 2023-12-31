// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;
import 'package:vanilla/models/body/home_enum.dart';
import 'package:vanilla/ui/views/auth/login/login_view.dart' as _i6;
import 'package:vanilla/ui/views/auth/onboarding/name_view.dart';
import 'package:vanilla/ui/views/auth/onboarding/onboarding_view.dart' as _i5;
import 'package:vanilla/ui/views/auth/onboarding/otp_verification.dart';
import 'package:vanilla/ui/views/auth/onboarding/setup_view.dart';
import 'package:vanilla/ui/views/auth/splash/splash_view.dart' as _i4;
import 'package:vanilla/ui/views/home/delivery/delivery_details_view.dart';
import 'package:vanilla/ui/views/home/delivery/delivery_summary_view.dart';
import 'package:vanilla/ui/views/home/home_view.dart' as _i2;
import 'package:vanilla/ui/views/profile/edit_profile.dart';
import 'package:vanilla/ui/views/profile/saved_locations.dart';

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const splashView = '/splash-view';

  static const onboardingView = '/onboarding-view';

  static const loginView = '/login-view';

  static const otpVerificationView = '/otpVerification-view';

  static const nameView = '/name-view';

  static const setupView = '/setup-view';

  static const deliveryDetailsView = '/delivery-details-view';

  static const deliverySummaryView = '/delivery-summary-view';

  static const editProfileView = '/edit-profile-view';

  static const savedLocationsView = '/saved-locations-view';

  static const all = <String>{
    homeView,
    startupView,
    splashView,
    onboardingView,
    loginView,
    otpVerificationView,
    nameView,
    setupView,
    deliveryDetailsView,
    deliverySummaryView,
    editProfileView,
    savedLocationsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.splashView,
      page: _i4.SplashView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i5.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.otpVerificationView,
      page: OTPVerificationView,
    ),
    _i1.RouteDef(
      Routes.nameView,
      page: NameView,
    ),
    _i1.RouteDef(
      Routes.setupView,
      page: SetupView,
    ),
    _i1.RouteDef(
      Routes.deliveryDetailsView,
      page: DeliveryDetailsView,
    ),
    _i1.RouteDef(
      Routes.deliverySummaryView,
      page: DeliverySummaryView,
    ),
    _i1.RouteDef(
      Routes.savedLocationsView,
      page: SavedLocationsView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: EditProfileView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      var args = data.getArgs<_i2.HomeViewArguments>(
        orElse: () =>
            _i2.HomeViewArguments(homeViewEnum: HomeViewEnum.dashboard),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(homeViewEnum: args.homeViewEnum),
        settings: data,
      );
    },
    _i4.SplashView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SplashView(),
        settings: data,
      );
    },
    _i5.OnboardingView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OnboardingView(),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    OTPVerificationView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => OTPVerificationView(
            type: (data.arguments as OTPVerificationArguments).type),
        settings: data,
      );
    },
    NameView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const NameView(),
        settings: data,
      );
    },
    SetupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const SetupView(),
        settings: data,
      );
    },
    DeliveryDetailsView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const DeliveryDetailsView(),
        settings: data,
      );
    },
    DeliverySummaryView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const DeliverySummaryView(),
        settings: data,
      );
    },
    EditProfileView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const EditProfileView(),
        settings: data,
      );
    },
    SavedLocationsView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const SavedLocationsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
