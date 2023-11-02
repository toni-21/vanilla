import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/utilities/constants/colors.dart';

import 'splash_viewmodel.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 23, 31, 1),
      body: Center(
          child: Shimmer.fromColors(
        baseColor: AppColors.primaryColor.withOpacity(0.85),
        highlightColor: Colors.grey.shade50,
        // baseColor: AppColors.primaryColor.withOpacity(0),
        // highlightColor:AppColors.secondaryColor,//
        enabled: true,
        child:
            SvgPicture.asset('assets/images/logo.svg', semanticsLabel: 'logo'),
      )),
    );
  }

  @override
  SplashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
