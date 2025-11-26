import 'package:dartz/dartz.dart';
import 'package:doux_sejour/core/error/failure.dart';
import 'package:doux_sejour/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, dynamic>> connexion(String email, String password);
}
