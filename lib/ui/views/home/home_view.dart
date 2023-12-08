import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/models/body/home_enum.dart';
import 'package:vanilla/ui/common/custom_loader.dart';
import 'package:vanilla/ui/views/activity/activity_view.dart';
import 'package:vanilla/ui/views/home/dashboard_view.dart';
import 'package:vanilla/ui/views/home/home_viewmodel.dart';
import 'package:vanilla/ui/views/profile/profile_view.dart';
import 'package:vanilla/ui/views/support/support_view.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/utilities/constants/images.dart';

class HomeView extends StatelessWidget {
  final HomeViewEnum homeViewEnum;
  const HomeView({required, Key? key, required this.homeViewEnum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
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
                icon: SvgPicture.asset(homeImage, height: 24.h),
                activeIcon: SvgPicture.asset(
                  homeImage,
                  height: 27.5.h,
                  color: AppColors.accentColor,
                ),
                label: HomeViewEnum.dashboard.name),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(activitiesImage, height: 24.h),
                activeIcon: SvgPicture.asset(
                  activitiesImage,
                  height: 27.5.h,
                  color: AppColors.accentColor,
                ),
                label: HomeViewEnum.activity.name),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(supportImage, height: 24.h),
                activeIcon: SvgPicture.asset(
                  supportImage,
                  height: 27.5.h,
                  color: AppColors.accentColor,
                ),
                label: HomeViewEnum.support.name),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(userImage, height: 24.h),
                activeIcon: SvgPicture.asset(
                  userImage,
                  height: 27.5.h,
                  color: AppColors.accentColor,
                ),
                label: HomeViewEnum.profile.name),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class HomeViewArguments {
  final HomeViewEnum homeViewEnum;
  HomeViewArguments({required this.homeViewEnum});
}
