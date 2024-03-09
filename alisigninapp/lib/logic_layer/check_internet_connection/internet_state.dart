part of 'internet_bloc.dart';

 class InternetState extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InternetInitial extends InternetState {

}
class Connected extends InternetState{
    String msg;
    Connected({required this.msg});
}

class NotConnected extends InternetState{
  String msg;
  NotConnected({required this.msg});
}
