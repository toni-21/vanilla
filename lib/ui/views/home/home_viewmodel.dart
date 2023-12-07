import 'package:flutter/material.dart';
import 'package:vanilla/app/app.bottomsheets.dart';
import 'package:vanilla/app/app.dialogs.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/utilities/constants/strings.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _dialogService = locator<DialogService>();
  final _navigatorService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final mainScrollController = ScrollController();
  final pickupController = TextEditingController();
  final dropOffController = TextEditingController();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void goSplash() {
    _navigatorService.navigateTo(Routes.splashView);
  }

   void goToDeliveryDets() {
    _navigatorService.navigateTo(Routes.deliveryDetailsView);
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
