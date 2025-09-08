import 'dart:convert';
import 'package:client/core/failure/failure.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<Either<Failure, UserModel>> signup({
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
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      return response.statusCode == 201
          ? right(UserModel.fromMap(resBodyMap))
          : left(Failure(resBodyMap['detail']));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/auth/login'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      return response.statusCode == 200
          ? right(UserModel.fromMap(resBodyMap))
          : left(resBodyMap['detail']);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
