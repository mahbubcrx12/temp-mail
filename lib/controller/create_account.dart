import 'package:dio/dio.dart';

class AccountService{
  static const String apiUrl = 'https://api.mail.tm/accounts';
  static Dio dio = Dio();
    static Future<Map<String, dynamic>?> createAccount(String email, String password) async {
      try {
        final data = {
          "address": email,
          "password": password,
        };

        final response = await dio.post(apiUrl, data: data);

        if (response.statusCode == 201) {
          final responseData = response.data as Map<String, dynamic>;
          final accountId = responseData['id'] as String;
          final address = responseData['address'] as String;
          final createdAt = responseData['createdAt'] as String;
          return responseData;
        } else {
          print('Failed to create account');
          return null;
        }
      } catch (e) {
        print('Error: $e');
        return null;
      }
    }
}
