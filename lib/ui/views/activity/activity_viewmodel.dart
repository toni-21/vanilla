import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/models/body/activity_enum.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/utilities/function_helpers/printf.dart';

class ActivityViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  ActivityEnum selectedActivityTab = ActivityEnum.ongoing;
  double ratingValue = 0;

  void setActivity(ActivityEnum activityEnum) {
    selectedActivityTab = activityEnum;
    rebuildUi();
  }

  selectRating(int index) {
    double newRating = index + 1.0;
    if (newRating == ratingValue) {
      newRating -= 0.5;
    }
    ratingValue = newRating;
    notifyListeners();
    printf('Selected Rating: $ratingValue');
  }
}
