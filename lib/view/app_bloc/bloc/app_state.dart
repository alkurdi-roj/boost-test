part of 'app_bloc.dart';


@immutable
class AppState {
  final bool isUserLoggedIn;
  final LoginModel userData;



  const AppState( {
    required this.isUserLoggedIn,
    required this.userData,


  });

  factory AppState.initial() {
    return const AppState(
      isUserLoggedIn: false,
      userData: LoginModel(),

    );
  }

  AppState copyWith({
    final bool? isUserLoggedIn,
    final LoginModel? userData,

  }) {
    return AppState(
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      userData: userData ?? this.userData,

    );
  }
}


enum GetUnreadDataStateStatus {init , loading , success , error}

enum UnreadData{ events, homework, albums , notifications,messages }