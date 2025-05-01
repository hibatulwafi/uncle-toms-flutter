import 'package:dio/dio.dart';
import '../models/notif.dart';
import 'dio_client.dart'; // Pastikan path sesuai

class NotificationService {
  final Dio _dio = DioClient().dio;

  // Ambil daftar notifikasi
  Future<List<Notif>> getNotification() async {
    try {
      final response = await _dio.get('/notifications');
      final List<dynamic> data = response.data;
      return data.map((json) => Notif.fromJson(json)).toList();
    } on DioException catch (e) {
      rethrow;
    }
  }

  // Hitung total notifikasi
  Future<int> getUnreadNotificationCount() async {
    try {
      final response = await _dio.get('/notifications');
      final List<dynamic> data = response.data;
      final unread = data
          .where((json) => json['is_read'] == false || json['is_read'] == 0)
          .length;
      return unread;
    } on DioException catch (e) {
      rethrow;
    }
  }
}
