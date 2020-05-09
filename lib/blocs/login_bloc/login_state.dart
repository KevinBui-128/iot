part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object> get props => null;
}

class SuccessState extends LoginState {
  final String title;
  final String message;
  SuccessState({this.title, this.message});
  @override
  List<Object> get props => [title, message];
}

class ErrorState extends LoginState {
  final String errorTitle;
  final String errorMessage;
  ErrorState({this.errorTitle, this.errorMessage});
  @override
  List<Object> get props => [errorTitle, errorMessage];
}
