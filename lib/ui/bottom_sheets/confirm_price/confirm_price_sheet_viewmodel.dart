import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/services/app_service.dart';

class ConfirmPriceSheetViewModel extends BaseViewModel {
  final _appService = locator<AppService>();
  final _navigationService = locator<NavigationService>();

  double _selectedAmount = 0;

  double get selectedAmount => _selectedAmount;

  void confirmAmount(double value) {
    _selectedAmount = value;

    rebuildUi();
    _navigationService.replaceWithHomeView();
  }
}
