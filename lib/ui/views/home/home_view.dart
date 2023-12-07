import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/models/body/home_enum.dart';
import 'package:vanilla/ui/common/custom_loader.dart';
import 'package:vanilla/ui/views/activity/activity_view.dart';
import 'package:vanilla/ui/bottom_nav/bottom_nav_viewmodel.dart';
import 'package:vanilla/ui/views/home/dashboard_view.dart';
import 'package:vanilla/ui/views/profile/profile_view.dart';
import 'package:vanilla/ui/views/support/support_view.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class HomeView extends StatelessWidget {
  final HomeViewEnum homeViewEnum;
  const HomeView({required, Key? key, required this.homeViewEnum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: model.isBusy
            ? customLoader()
            : IndexedStack(index: model.currentIndex, children: const [
                DashboardView(),
                ActivityView(),
                SupportView(),
                ProfileView()
              ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: model.currentIndex,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_outlined),
                label: HomeViewEnum.dashboard.name),
            BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                activeIcon: Icon(Icons.article_outlined),
                label: HomeViewEnum.activity.name),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                activeIcon: Icon(Icons.message_outlined),
                label: HomeViewEnum.support.name),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person),
                label: HomeViewEnum.profile.name),
          ],
        ),
      ),
      viewModelBuilder: () => BottomNavViewModel(),
    );
  }
}

class HomeViewArguments {
  final HomeViewEnum homeViewEnum;
  HomeViewArguments({required this.homeViewEnum});
}
