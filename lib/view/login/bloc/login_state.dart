part of 'login_bloc.dart';

@immutable
class LoginState {
  final LoginModel user;
  final String errorMessage;
  final LoginStateStatus loginStateStatus;

  const LoginState({required this.user,required this.errorMessage, required this.loginStateStatus});

  factory LoginState.init(){
    return const LoginState(
      user: LoginModel(),
      loginStateStatus: LoginStateStatus.init,
      errorMessage: ''
    );
  }

  LoginState copyWith({
    LoginModel? user,
    String? errorMessage,
    LoginStateStatus? loginStateStatus,
  }){
    return LoginState(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      loginStateStatus: loginStateStatus ?? this.loginStateStatus,
    );
}

}


enum LoginStateStatus{ init , loading , success ,error}
