import 'package:alisigninapp/core/widgets/on_bording_view/widgets/page_view_item.dart';
import 'package:flutter/cupertino.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key,required this.pageController}) : super(key: key);
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: 'assets/images/pngwing.com22.png',
          title: 'E-Shopping',
          subTitle: 'Explore best organic fruits & grab them',
        ),
        PageViewItem(
          image: 'assets/images/pngwing.com (1)1.png',
          title: 'Delivery On The Way',
          subTitle: 'Get Your Order By Free And Speed Delivery',
        ),
        PageViewItem(
          image: 'assets/images/pngwing.com (2).png',
          title: 'Delivery Arrived',
          subTitle: 'Order Is Arrived At Your Place',
        ),
      ],
    );
  }
}
