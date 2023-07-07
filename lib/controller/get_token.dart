import 'package:dio/dio.dart';

class TokenService {
  static String? jwtToken;
  static const String tokenUrl = 'https://api.mail.tm/token';
  static Dio dio = Dio();

  static Future<String?> getJwtToken(String email, String password) async {
    try {
      final data = {
        "address": email,
        "password": password,
      };
      final response = await dio.post(tokenUrl, data: data);
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        jwtToken = responseData['token'] as String?;
        return jwtToken;
      } else {
        print('Failed to get JWT token');
        return jwtToken;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
