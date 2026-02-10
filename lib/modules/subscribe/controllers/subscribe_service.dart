import 'package:get/get.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class SubscribeService extends GetxService {
  final _apiClient = Get.find<ApiClient>();

  Future<bool> cancelSubscribe(String mediaKey) async {
    final response = await _apiClient.post(
      '/api/v1/subscribe/cancel/$mediaKey',
    );
    return response.statusCode == 200;
  }

  Future<bool> submitSubscribe(String mediaKey) async {
    final response = await _apiClient.post(
      '/api/v1/subscribe/submit/$mediaKey',
    );
    return response.statusCode == 200;
  }
}
