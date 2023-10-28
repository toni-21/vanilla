import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          child:
              SvgPicture.asset('assets/images/logo.svg', semanticsLabel: 'logo')),
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
