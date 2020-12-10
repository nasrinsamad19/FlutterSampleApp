import 'dart:convert';
import 'dart:io';

class NetWork {
  NetWork._();

  static Future<String> query() async {
    var httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://api.caiyunapp.com/v2/TAkhjf8d1nlSlspN/121.6544,25.1552/realtime.json"));
    request.headers.add("user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
    HttpClientResponse response = await request.close();
    String text = await response.transform(utf8.decoder).join();
    print(response.headers);
    httpClient.close();
    return text;
  }
}