import 'package:dartz/dartz.dart';
import 'package:doux_sejour/features/login/domain/enums/permission.dart';

enum UserRole {
  admin(
    label: "Administrateur",
    permissions: Right({Permission.read, Permission.write, Permission.delete}),
  ),
  user(label: "Utilisateur", permissions: Left(Permission.read)),
  nurse(
    label: "Infirmiere",
    permissions: Right({Permission.read, Permission.write}),
  ),
  manager(
    label: "Manager",
    permissions: Right({Permission.read, Permission.write, Permission.delete}),
  ),
  ash(
    label: "Agent de service hotelier",
    permissions: Right({Permission.read, Permission.write}),
  ),
  caregiver(
    label: "Aide soignant",
    permissions: Right({Permission.read, Permission.write}),
  );

  const UserRole({required this.label, required this.permissions});

  final String label;
  final Either<Permission, Set<Permission>> permissions;

  bool hasPermission(Permission permission) => permissions.fold(
    (single) => single == permission,
    (multiple) => multiple.contains(permission),
  );
}
