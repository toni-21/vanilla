import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/custom_loader.dart';
import 'package:vanilla/ui/views/bottom_nav/bottom_nav_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';



class BottomNavView extends StatelessWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      // onModelReady: (model) => model.convertDate(),
      // onModelReady: (model) => model.getDocs(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.white,
        body: model.isBusy
            ? customLoader()
            : IndexedStack(index: model.currentIndex, children:const [
                // WeekView(),
                // MonthView(),
                // UsersView(),
              ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:AppColors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: model.currentIndex,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          onTap: model.setIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_view_week),
                activeIcon: Icon(Icons.calendar_view_week),
                label: '1 week'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                activeIcon: Icon(Icons.calendar_month),
                label: '1 month'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person),
                label: 'Users'),
          ],
        ),
      ),
      viewModelBuilder: () => BottomNavViewModel(),
    );
  }
}
