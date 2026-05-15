import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final Map<String, dynamic> body = {
    'browseId': 'FEmusic_analytics_charts_home',
    'context': {
      'client': {
        'clientName': 'WEB_MUSIC_ANALYTICS',
        'clientVersion': '2.0',
        'hl': 'en',
        'gl': 'VN',
      }
    },
    'query': 'flags=MusicCharts__enable_apac_and_shorts_charts_expansion&perspective=CHART_DETAILS&chart_params_country_code=vn&chart_params_chart_type=TRACKS&chart_params_period_type=WEEKLY'
  };

  final response = await http.post(
    Uri.parse('https://charts.youtube.com/youtubei/v1/browse?alt=json'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

  final data = jsonDecode(response.body);
  try {
    final contents = data['contents']['sectionListRenderer']['contents'];
    final section = contents[0]['musicAnalyticsSectionRenderer']['content'];
    
    print('Keys in section: ${section.keys}');
    if (section.containsKey('trackTypes')) {
      final tracksWrapper = section['trackTypes'];
      print('trackTypes length: ${tracksWrapper.length}');
      if (tracksWrapper is List && tracksWrapper.isNotEmpty) {
          final firstWrapper = tracksWrapper[0];
          print('First wrapper keys: ${firstWrapper.keys}');
          if (firstWrapper.containsKey('trackViews')) {
              final trackViews = firstWrapper['trackViews'];
              print('trackViews length: ${trackViews.length}');
              print('First track title: ${trackViews[0]['name']}');
          }
      }
    }
  } catch (e) {
    print('Error parsing: $e');
  }
}
