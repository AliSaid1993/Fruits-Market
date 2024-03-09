part of 'auth_bloc.dart';

 class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class StartEvent extends AuthEvent{

}
class SignInButtonPress extends AuthEvent{}
class SignInButtonPressSuccesed extends AuthEvent{
      final String username;
      final String password;
      SignInButtonPressSuccesed({required this.username,required this.password});
}


class SignUpButtonPressedSuccess extends AuthEvent{
   final String firstname;
   final String lastname;

   final String username;

   final String email;
   final String phone;


   final String password;

   SignUpButtonPressedSuccess({
     required this.email,
     required this.password,
     required this.firstname,
     required this.lastname,
     required this.username,
     required this.phone
});


}