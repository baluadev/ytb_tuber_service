import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final Map<String, dynamic> body = {
    'browseId': 'FEmusic_moods_and_genres_category',
    'params': 'ggMPOg1uX1JOQWZFeDByc2Jm', // The params from "Chill"
    'context': {
      'client': {
        'clientName': 'WEB_REMIX',
        'clientVersion': '1.20240101.01.00',
        'hl': 'en',
        'gl': 'US',
      }
    }
  };

  final response = await http.post(
    Uri.parse('https://music.youtube.com/youtubei/v1/browse?alt=json'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

  final data = jsonDecode(response.body);
  final contents = data['contents']['singleColumnBrowseResultsRenderer']['tabs'][0]['tabRenderer']['content']['sectionListRenderer']['contents'];
  final items = contents[0]['musicCarouselShelfRenderer']['contents'];
  print(items[0]);
}
