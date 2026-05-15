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
    'query': 'flags=MusicCharts__enable_apac_and_shorts_charts_expansion&perspective=CHART_DETAILS&chart_params_country_code=vn&chart_params_chart_type=VIDEOS&chart_params_period_type=DAILY'
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
    
    print('Available keys in section content: ${section.keys}');
    if (section.containsKey('videos')) {
      final videos = section['videos'];
      print('videos found. Type: ${videos.runtimeType}');
      if (videos is List && videos.isNotEmpty) {
          print('videos length: ${videos.length}');
          print('videos[0] keys: ${(videos[0] as Map).keys}');
          if (videos[0].containsKey('videoViews')) {
              print('Found videoViews in videos[0]');
              final vv = videos[0]['videoViews'];
              print('videoViews type: ${vv.runtimeType}');
              if (vv is List && vv.isNotEmpty) {
                  print('First video: ${vv[0]['title']}');
              }
          }
      }
    } else {
      print('No videos found in content.');
    }
  } catch (e) {
    print('Error parsing: $e');
  }
}
