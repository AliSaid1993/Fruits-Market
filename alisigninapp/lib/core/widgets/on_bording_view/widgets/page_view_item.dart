

import 'package:flutter/cupertino.dart';

import '../../../utils/size_config.dart';
import '../../spacer_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, this.title, this.subTitle, this.image}) : super(key: key);
  final String? title;
  final String? subTitle;
  final String? image;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(22),

        SizedBox(
            height: SizeConfig.defaultSize! * 20,
            child: Image.asset(image!)),
         const VerticalSpace(2.5),
         Text(
          title!,
          style: TextStyle(
            fontFamily: 'Poppiins',
            fontSize: 20,
            color: Color(0xff2f2e41),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        const VerticalSpace(1),

        Text(
            subTitle!,
          style: TextStyle(
            fontFamily: 'Poppiins',
            fontSize: 15,
            color: Color(0xff78787c),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
