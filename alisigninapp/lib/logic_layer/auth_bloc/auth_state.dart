part of 'auth_bloc.dart';

 class AuthState extends Equatable {
  const AuthState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInInitialState extends AuthState{
}
class SignInLoadingState extends AuthState{}
class SignInLoadedStateSucces extends AuthState{
   final UserModel user;

  SignInLoadedStateSucces(this.user);
}
class SignInFailureState extends AuthState{
   String msg;
   SignInFailureState({required this.msg});
}
class SignInErrorState extends AuthState{
  String msg;
  SignInErrorState({required this.msg});
}

class SignUpInitialState extends AuthState{
}
class SignUpLoadingState extends AuthState{}
class SignUpLoadedStateSucces extends AuthState{}
