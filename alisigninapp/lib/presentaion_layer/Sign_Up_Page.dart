import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic_layer/auth_bloc/auth_bloc.dart';

class Sign_Up_Page extends StatefulWidget {
  const Sign_Up_Page({Key? key}) : super(key: key);

  @override
  State<Sign_Up_Page> createState() => _Sign_Up_PageState();
}

class _Sign_Up_PageState extends State<Sign_Up_Page> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();

  GlobalKey<FormState> _key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Register please')),
        backgroundColor: Colors.lightBlue,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is SignUpLoadedStateSucces){
            Navigator.pushNamed(context, '/');
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  TextFormField(
                    controller: firstname,
                    decoration: InputDecoration(
                      hintText: "your firstname",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: ((value) {
                      if(value!.isEmpty){
                        return "firstname cannot be empty";
                      }
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: lastname,
                    decoration: InputDecoration(
                      hintText: "your lastname",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: ((value) {
                      if(value!.isEmpty){
                        return "lastname cannot be empty";
                      }
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                      hintText: "your username",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    validator: ((value) {
                      if(value!.isEmpty){
                        return "username cannot be empty";
                      }
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                      hintText: "your phone",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: ((value) {
                      if(value!.isEmpty){
                        return "phone cannot be empty";
                      }
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "your email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: ((value) {
                      if(value!.isEmpty){
                        return "email cannot be empty";
                      }
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "your password",

                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: ((value) {
                      if(value!.isEmpty){
                        return "password cannot be empty";
                      }
                    }),
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
                        if(_key.currentState!.validate()){
                          BlocProvider.of<AuthBloc>(context).add(SignUpButtonPressedSuccess(
                              firstname: firstname.text,
                              lastname: lastname.text,
                              username: username.text,
                              phone: phone.text,
                              email: email.text,
                              password: password.text));
                        }

                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
