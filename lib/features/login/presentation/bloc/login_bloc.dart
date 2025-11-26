import 'package:dartz/dartz.dart';
import 'package:doux_sejour/core/error/failure.dart';
import 'package:doux_sejour/features/login/domain/entities/user.dart';
import 'package:doux_sejour/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginState {
  final bool loading;
  final User? user;
  final Failure? error;
  const LoginState({this.loading = false, this.user, this.error});
}

class LoginBloc extends Cubit<LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(const LoginState());

  Future<void> login(String email, String password) async {
    emit(const LoginState(loading: true));
    final result = await repository.connexion(email, password);

    result.fold(
      (failure) => emit(LoginState(error: failure)),
      (user) => emit(LoginState(user: user)),
    );
  }
}
