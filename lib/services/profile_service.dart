import 'package:dio/dio.dart';
import '../models/profile.dart';
import 'dio_client.dart'; // Pastikan path sesuai

class ProfileService {
  final Dio _dio = DioClient().dio;

  Future<Profile> getProfile() async {
    try {
      final response = await _dio.get('/profile');
      return Profile.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    }
  }
}
