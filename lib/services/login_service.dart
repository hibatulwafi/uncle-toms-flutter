import 'package:dio/dio.dart';
import 'dio_client.dart';

class LoginService {
  final Dio _dio = DioClient().dio;

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data != null) {
        final token = response.data['access_token'];

        if (token != null) {
          await DioClient().saveToken(token);
        }

        return response.data;
      } else {
        throw Exception("Login gagal");
      }
    } on DioException catch (e) {
      throw Exception("Login error: ${e.response?.data ?? e.message}");
    }
  }
}
