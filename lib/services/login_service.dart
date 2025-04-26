import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dio_client.dart'; // sesuaikan path

class LoginService {
  final Dio _dio = DioClient().dio;

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      // Jika login berhasil dan ada data/token
      if (response.statusCode == 200 && response.data != null) {
        final prefs = await SharedPreferences.getInstance();

        // Simpan status login
        prefs.setBool('isLoggedIn', true);

        // (Opsional) Simpan token jika dikirim dari API
        // prefs.setString('token', response.data['token']);

        return response.data;
      } else {
        throw Exception("Login gagal");
      }
    } on DioException catch (e) {
      // Bisa tambahkan handling error yang lebih baik di sini
      rethrow;
    }
  }
}
