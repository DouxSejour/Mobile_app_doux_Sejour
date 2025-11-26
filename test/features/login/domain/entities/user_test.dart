import 'package:doux_sejour/features/login/domain/entities/user.dart';
import 'package:doux_sejour/features/login/domain/enums/permission.dart';
import 'package:doux_sejour/features/login/domain/enums/user_role.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late User user;

  group('should test single user permission', () {
    setUp(() {
      user = User(
        id: 1,
        email: "Michu@gmail.com",
        firstName: "Michu",
        lastName: "Obrayan",
        role: UserRole.user,
      );
    });

    test('User should have the permission', () {
      // GIVEN
      final expectedResult = true;
      // WHEN
      final bool permissionUser = user.role.hasPermission(Permission.read);
      // THEN
      expect(permissionUser, expectedResult);
    });

    test("User Shouldn't have the permission", () {
      // GIVEN
      final expectedResult = false;
      // WHEN
      final bool permissionUser = user.role.hasPermission(Permission.write);
      // THEN
      expect(permissionUser, expectedResult);
    });
  });

  group('should test a set of permissions user', () {
    setUp(() {
      user = User(
        id: 1,
        email: "Tartanpion@gmail.com",
        firstName: "Tartanpion",
        lastName: "Ricar",
        role: UserRole.ash,
      );
    });
    test("User should have write and read permission", () {
      // GIVEN
      final expectedResult = true;
      // WHEN
      final bool permissionUser = user.role.hasPermission(Permission.write);
      // THEN
      expect(permissionUser, expectedResult);
    });

    test("User shouldn't have delete permission", () {
      // GIVEN
      final expectedResult = false;
      // WHEN
      final bool permissionUser = user.role.hasPermission(Permission.delete);
      // THEN
      expect(permissionUser, expectedResult);
    });
  });
}
