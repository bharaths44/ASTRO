part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class SignupButtonPressed extends SignupEvent {
  final String email;
  final String password;

  SignupButtonPressed({required this.email, required this.password});
}
