// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Splash_View extends StatefulWidget {
//   const Splash_View({Key? key}) : super(key: key);
//
//   @override
//   State<Splash_View> createState() => _Splash_ViewState();
// }
//
// class _Splash_ViewState extends State<Splash_View>
//     with SingleTickerProviderStateMixin {
//   AnimationController? animationController;
//   Animation<double>? fadingAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//         vsync: this,
//         duration: Duration(
//           milliseconds: 600,
//         ));
//     fadingAnimation = Tween<double>(begin: .2, end: 1)
//         .animate(animationController!);
//
//
//     animationController!.repeat(reverse: true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green.shade700,
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FadeTransition(opacity: fadingAnimation!,
//               child:Text(
//                 'Fruits Market',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 51,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 80,
//             ),
//             Image.asset('assets/images/pngwing.com (1).png'),
//             SizedBox(
//               height: 50,
//             ),
//
//             SizedBox(
//               height: 20,
//             ),
//             Text('_OR_'),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'sign_up_page');
//               },
//               child: Text('Sign_Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
