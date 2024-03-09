import 'package:alisigninapp/models/user_models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo repo;

  AuthBloc(this.repo) : super(SignInInitialState()) {
    on<StartEvent>((event, emit) async {
      // TODO: implement event handler
      emit(SignInLoadingState());
    });
    on<SignInButtonPress>((event, emit) => emit(SignInLoadingState()));
    on<SignInButtonPressSuccesed>((event, emit) async {
      var pref = await SharedPreferences.getInstance();
      emit(SignInLoadingState());
      try {
        var data = await repo.signIn(event.username, event.password);
        if (data["status"] == 200) {
          await pref.setString("access", data["body"]["access"]);
          var user = await repo.getUserInfo();
          emit(SignInLoadedStateSucces(user!));
        } else if (data["detail"] != null) {
          emit(SignInFailureState(msg: data["datail"]));
        } else {
          emit(SignInErrorState(msg: data));
        }
      } catch (e) {
        print(e.toString());
        emit(SignInErrorState(msg: e.toString()));
      }

      });
    on<SignUpButtonPressedSuccess>((event, emit) async {
      var pref = SharedPreferences.getInstance();
      emit(SignUpLoadingState());
      try {
        var user1= await repo.signup(event.username, event.firstname,event.lastname,event.password,
              event.phone,event.email, );
        emit(SignUpLoadedStateSucces());
      } catch (e) {
        e.toString();
      }
    });
  }
}
