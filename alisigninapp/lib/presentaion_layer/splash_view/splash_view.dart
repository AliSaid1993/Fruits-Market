import 'package:alisigninapp/presentaion_layer/splash_view/widgets/splash_view_bpdy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kmainColor,
      body: Splash_View_Body(),
    );
  }
}
