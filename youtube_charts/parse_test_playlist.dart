import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final Map<String, dynamic> body = {
    'browseId': 'VLRDCLAK5uy_nBE4bLuBHUXWZrF59ZrkPEToKt8M_I3Vc',
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
    final contents = data['contents']?['twoColumnBrowseResultsRenderer']?['secondaryContents']?['sectionListRenderer']?['contents'];
    if (contents != null && contents.isNotEmpty) {
      final playlistContents = contents[0]['musicPlaylistShelfRenderer']?['contents'];
      print('Found ${playlistContents?.length} tracks in playlist');
      if (playlistContents != null && playlistContents.isNotEmpty) {
        final firstTrack = playlistContents[0]['musicResponsiveListItemRenderer'];
        final title = firstTrack?['flexColumns']?[0]?['musicResponsiveListItemFlexColumnRenderer']?['text']?['runs']?[0]?['text'];
        print('  First track: $title');
      }
    }
  } catch (e) {
    print('Error parsing: $e');
  }
}
