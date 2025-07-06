import 'dart:convert';
import 'package:http/http.dart' as http;

class KakaoMapService {
  final String apiKey = 'YOUR_KAKAO_REST_API_KEY';

  Future<double?> getDistance(String origin, String destination) async {
    final url = Uri.parse('https://apis-navi.kakaomobility.com/v1/directions?origin=$origin&destination=$destination');

    final response = await http.get(
      url,
      headers: {'Authorization': 'KakaoAK $apiKey'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final summary = data['routes'][0]['summary'];
      final distance = summary['distance'];
      return distance / 1000.0; // meters → kilometers
    } else {
      print('Kakao API error: ${response.statusCode}');
      return null;
    }
  }
}
