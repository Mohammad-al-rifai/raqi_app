import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../app/resources/assets_manager.dart';
import '../../../app/resources/colors_manager.dart';
import '../../../app/resources/constants.dart';
import '../../layouts/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
      const Duration(seconds: Constants.splashDelay),
      _goNext,
    );
  }

  _goNext() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeLayout()));
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: ColorManager.primary,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: ColorManager.darkPrimary,
        ),
      ),
      body: Center(
        child: Lottie.asset(
          JsonAssets.splashLogo,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
