import 'package:doux_sejour/features/login/domain/enums/user_role.dart';
import 'package:equatable/equatable.dart';

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final UserRole role;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
  });
}
