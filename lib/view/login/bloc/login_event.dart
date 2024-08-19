part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class NormalLoginEvent extends LoginEvent {
  final String userName;
  final String password;


  NormalLoginEvent({
    required this.userName,
    required this.password,

  });
}
