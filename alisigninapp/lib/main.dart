import 'package:alisigninapp/logic_layer/auth_bloc/auth_bloc.dart';
import 'package:alisigninapp/logic_layer/cart_bloc/cart_bloc.dart';
import 'package:alisigninapp/logic_layer/cart_item_bloc/cart_item_bloc.dart';
import 'package:alisigninapp/logic_layer/check_internet_connection/internet_bloc.dart';
import 'package:alisigninapp/presentaion_layer/Sign_Up_Page.dart';
import 'package:alisigninapp/presentaion_layer/cart_screen.dart';
import 'package:alisigninapp/presentaion_layer/deatails_Page.dart';
import 'package:alisigninapp/presentaion_layer/home_Page.dart';
import 'package:alisigninapp/presentaion_layer/sign_in_page.dart';
import 'package:alisigninapp/presentaion_layer/splash_view.dart';
import 'package:alisigninapp/presentaion_layer/splash_view/splash_view.dart';
import 'package:alisigninapp/repositories/auth_repo.dart';
import 'package:alisigninapp/repositories/cart_repository.dart';
import 'package:alisigninapp/repositories/categoiry_repo.dart';
import 'package:alisigninapp/repositories/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'logic_layer/category_bloc/category_bloc.dart';
import 'logic_layer/product_bloc/product_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepo()),
        RepositoryProvider(
          create: (context) => Category_Repo(),
        ),
        RepositoryProvider(
          create: (context) => Product_Repo(),
        ),
        RepositoryProvider(
          create: (context) => CartRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InternetBloc>(create: (context) => InternetBloc()),
          BlocProvider(
              create: (context) =>
                  AuthBloc(RepositoryProvider.of<AuthRepo>(context))),
          BlocProvider(
              create: (context) =>
                  CategoryBloc(RepositoryProvider.of<Category_Repo>(context))),
          BlocProvider(
              create: (context) =>
                  ProductBloc(RepositoryProvider.of<Product_Repo>(context))),
          BlocProvider(
              create: (context) =>
                  VendorCartBloc(cartRepository: RepositoryProvider.of<CartRepository>(context)
                  )),
          BlocProvider(
              create: (context) =>
                  CartItemBloc(cartRepository: RepositoryProvider.of<CartRepository>(context)
                  )),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lightBlue[800],
          ),
          initialRoute: '/',
          routes: {
             '/': (context) => const SplashView(),
            'Sign_in_page': (context) => const SignInPage(),
            'homepage': (context) => const HomePage(),
            'sign_up_page': (context) => const Sign_Up_Page(),
            'cart_products': (context) => const CartScreen(),
            // 'detail_page' :(context) => const DetailPage(),
            // 'categories': (context) => const CategoriesPage(),
            // 'products': (context) => const ProductsPage(),
          },
        ),
      ),
    );
  }
}
