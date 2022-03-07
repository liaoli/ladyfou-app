import 'package:ladyfou/core/http/base_url.dart';

String getImageUrl(String uri) {
  if (uri.startsWith("https://") || uri.startsWith("http://")) {
    return uri;
  } else if (uri.startsWith("//")) {
    return "https:" + uri;
  }
  return baseUrl + uri;
}
