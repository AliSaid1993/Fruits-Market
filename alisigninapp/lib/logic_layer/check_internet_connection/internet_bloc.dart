import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription subscription;

  InternetBloc() : super(InternetInitial()) {
    on<OnConnected>((event, emit) {
      // TODO: implement event handler
      emit(Connected(msg: "Conneted"));
    });
    on<OnNotConnected>((event, emit) {
      emit(NotConnected(msg: "NotConnected"));
    });
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          if(result==ConnectivityResult.wifi||result==ConnectivityResult.mobile){
              add(OnConnected());
          }else{
            add(OnNotConnected());
          }
    });
  }
}
