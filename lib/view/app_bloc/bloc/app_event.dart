part of 'app_bloc.dart';


@immutable
abstract class AppEvent {}

class CheckLoggedInEvent extends AppEvent {}
class LogOutEvent extends AppEvent {}
