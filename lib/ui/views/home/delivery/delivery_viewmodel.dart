import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.bottomsheets.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/app/app.router.dart';
import 'package:vanilla/models/body/delivery_details.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/ui/views/home/home_viewmodel.dart';

class DeliveryViewModel extends HomeViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String? selectedCategory;
  String selectedPaymentMethod = '';
  List<String> categoryList = ['Clothing', 'Appliance', 'Shoes', 'Computers'];

  void selectCategory(String value) {
    selectedCategory = value;
    rebuildUi();
  }

  void selectPaymentMethod(String value) {
    selectedPaymentMethod = value;
    rebuildUi();
  }

  void goToDeliverySummary() {
    _navigationService.navigateTo(Routes.deliverySummaryView);
  }

  void showConfirmPriceBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.confirmPrice,
      title: 'Confirm Price',
      data: DeliveryDetailsModel(title: 'Toni', amount: 3000.0),
      description: 'Total Fee',
    );
  }
}
