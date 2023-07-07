import 'package:assignment_asiatic/model/email_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  final Dio _dio = Dio();
  final emails = <EmailModel>[].obs;

  Future<void> fetchEmails(String? accessTokenUser) async {
    final url = 'https://api.mail.tm/messages';
    final accessToken = accessTokenUser;

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final emailList = responseData['hydra:member'] as List<dynamic>;

        emails.value = emailList
            .map((emailJson) => EmailModel.fromJson(emailJson))
            .toList();
      } else {
        print('Failed to fetch emails');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
