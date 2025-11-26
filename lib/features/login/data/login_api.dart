import 'package:doux_sejour/core/network/api_client.dart';
import 'package:doux_sejour/features/login/domain/entities/user.dart';
import 'package:doux_sejour/features/login/domain/enums/user_role.dart';

abstract class LoginApi {
  Future<dynamic> login(String email, String password);
}

class LoginApiImpl implements LoginApi {
  final ApiClient client;

  const LoginApiImpl(this.client);

  @override
  Future<dynamic> login(String email, String password) async {
    final data = await client.post("/api/auth/login", {
      "email": email,
      "password": password,
    });
    return data;
  }
}
