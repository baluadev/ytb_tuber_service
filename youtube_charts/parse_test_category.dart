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
  try {
    final contents = data['contents']?['singleColumnBrowseResultsRenderer']?['tabs']?[0]?['tabRenderer']?['content']?['sectionListRenderer']?['contents'];
    if (contents != null) {
      print('Found ${contents.length} sections in category');
      for (var section in contents) {
        if (section.containsKey('gridRenderer')) {
          final grid = section['gridRenderer'];
          final header = grid['header']?['gridHeaderRenderer']?['title']?['runs']?[0]?['text'];
          final items = grid['items'];
          print('Section: $header, Items: ${items?.length}');
          if (items != null && items.isNotEmpty) {
            final firstItem = items[0]['musicTwoRowItemRenderer']?['title']?['runs']?[0]?['text'];
            print('  First playlist: $firstItem');
          }
        } else if (section.containsKey('musicCarouselShelfRenderer')) {
          final shelf = section['musicCarouselShelfRenderer'];
          final header = shelf['header']?['musicCarouselShelfBasicHeaderRenderer']?['title']?['runs']?[0]?['text'];
          final items = shelf['contents'];
          print('Carousel Section: $header, Items: ${items?.length}');
          if (items != null && items.isNotEmpty) {
            final firstItem = items[0]['musicTwoRowItemRenderer']?['title']?['runs']?[0]?['text'];
            print('  First playlist: $firstItem');
          }
        }
      }
    }
  } catch (e) {
    print('Error parsing: $e');
  }
}
