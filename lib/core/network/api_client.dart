import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doux_sejour/core/error/failure.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  const ApiClient({required this.baseUrl});

  Future<Map<String, dynamic>> post(
    String path,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + path),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (_) {
      rethrow;
    }

    throw Exception("Network Error");
  }
}
