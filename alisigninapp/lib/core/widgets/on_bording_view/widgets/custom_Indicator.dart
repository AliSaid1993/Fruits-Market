import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key, required this.dotindex}) : super(key: key);
  final double?  dotindex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: kmainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: kmainColor)
          )
      ),
      dotsCount: 3,
      position: dotindex!,
    );
  }
}
