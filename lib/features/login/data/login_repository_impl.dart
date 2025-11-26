import 'package:dartz/dartz.dart';
import 'package:doux_sejour/core/error/failure.dart';
import 'package:doux_sejour/features/login/data/login_api.dart';
import 'package:doux_sejour/features/login/domain/entities/user.dart';
import 'package:doux_sejour/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi api;

  LoginRepositoryImpl(this.api);

  @override
  Future<Either<Failure, dynamic>> connexion(String email, String password) async {
    try {
      final user = await api.login(email, password);
      print(user);
      return Right(user);
    } catch (e) {
      print("error : $e");
      return Left(Failure(message: "Serveur Failure"));
    }
  }
}
