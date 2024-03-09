import 'package:alisigninapp/core/constants.dart';
import 'package:alisigninapp/core/utils/size_config.dart';
import 'package:alisigninapp/logic_layer/auth_bloc/auth_bloc.dart';
import 'package:alisigninapp/logic_layer/cart_bloc/cart_bloc.dart';
import 'package:alisigninapp/logic_layer/category_bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic_layer/check_internet_connection/internet_bloc.dart';
import '../logic_layer/product_bloc/product_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
GlobalKey<FormState> _formkey=GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is Connected) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kmainColor,
                content: Text(state.msg)));
          } else if (state is NotConnected) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.lightBlue.shade500,
                content: Text(state.msg)));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kmainColor,
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Text('WELLCOME',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
            ),
          ),
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              // TODO: implement listener
              if(state is SignInLoadedStateSucces){
                BlocProvider.of<CategoryBloc>(context).add(LoadCategoriesEvent());
                BlocProvider.of<ProductBloc>(context).add(LoadProductEvent());
                BlocProvider.of<VendorCartBloc>(context).add(VendorCartLoadEvent());
                Navigator.pushNamed(context, 'homepage');
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(

                      child: CircleAvatar(
                          backgroundColor: kmainColor,
                          child: CircularProgressIndicator(color: Colors.orange.shade100,)),
                    );
                  } else if (state is SignInFailureState) {
                    return Text(
                      state.msg,
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            TextFormField(
                              controller: username,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                // icon: ,
                                hintText: "your email or your username",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return "username cannot be empty";
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: password,
                              decoration: const InputDecoration(
                                hintText: "your password",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                                prefixIcon: Icon(Icons.security),
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return "password cannot be empty";
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if(_formkey.currentState!.validate()){
                                    BlocProvider.of<AuthBloc>(context).add(
                                        SignInButtonPressSuccesed(
                                            username: username.text,
                                            password: password.text));
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 70,
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("if you do not register before"),
                                SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'sign_up_page');
                                  },
                                  child: Center(
                                    child: Text("Register Now"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}
