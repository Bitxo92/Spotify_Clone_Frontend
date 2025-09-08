import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<Either<String, Map<String, dynamic>>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );
      return response.statusCode == 201
          ? right(jsonDecode(response.body) as Map<String, dynamic>)
          : left(response.body);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/auth/login'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      return response.statusCode == 200
          ? right(jsonDecode(response.body) as Map<String, dynamic>)
          : left(response.body);
    } catch (e) {
      return left(e.toString());
    }
  }
}
