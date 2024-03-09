import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/widgets/on_bording_view/on_bording_view.dart';

class Splash_View_Body extends StatefulWidget {
  const Splash_View_Body({Key? key}) : super(key: key);

  @override
  State<Splash_View_Body> createState() => _Splash_View_BodyState();
}

class _Splash_View_BodyState extends State<Splash_View_Body>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController!.repeat(reverse: true);

    goToNextPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: fadingAnimation!,
            child: const Text(
              'Fruits Market',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 51,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Image.asset('assets/images/pngwing.com (1).png'),
        ],
      ),
    );
  }
}

void goToNextPage() {
  Future.delayed(Duration(seconds: 3), () {
    Get.to(() => On_Bording_View(), transition: Transition.fade);
  });
}
