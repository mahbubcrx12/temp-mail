import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DomainsController extends GetxController {
  final RxList<String> domains = <String>[].obs;
  final Dio _dio = Dio();

  Future<List<String>> fetchDomains() async {
    final url = 'https://api.mail.tm/domains';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> domainList = data['hydra:member'] as List<dynamic>;
        final List<String> domainNames = domainList.map((e) => e['domain'] as String).toList();
        return domainNames;
      }
    } catch (e) {
      print('Error: $e');
    }

    return [];
  }
}