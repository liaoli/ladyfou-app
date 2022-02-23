import 'package:get/get.dart';

class XRouter {
  static void goWeb(String url, String title) {
    Get.toNamed(
        "/web?url=${Uri.encodeComponent(url)}&title=${Uri.encodeComponent(title)}");
  }

  static void goCartPage() {
    Get.toNamed("/cart");
  }

  static void goSearchPage() {
    Get.toNamed("/search");
  }
}
