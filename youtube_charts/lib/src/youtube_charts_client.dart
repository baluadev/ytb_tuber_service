import 'dart:convert';
import 'package:http/http.dart' as http;
import 'country_code.dart';

class YouTubeChartsClient {
  static const String _baseUrl = 'https://charts.youtube.com/youtubei/v1/browse?alt=json';

  /// Fetch trending videos from YouTube Charts.
  /// [country] is optional. If provided, fetches charts for that country.
  /// If not provided, fetches global charts.
  Future<List<dynamic>> getTrendingIn({
    YouTubeChartsCountry country = YouTubeChartsCountry.global, 
  }) async {
    final Map<String, dynamic> body = {
      'browseId': 'FEmusic_analytics_charts_home',
      'context': {
        'client': {
          'clientName': 'WEB_MUSIC_ANALYTICS',
          'clientVersion': '2.0',
          'hl': 'en',
          'gl': country == YouTubeChartsCountry.global ? 'US' : country.code.toUpperCase(),
        }
      },
      'query': 'flags=MusicCharts__enable_apac_and_shorts_charts_expansion&perspective=CHART_DETAILS&chart_params_country_code=${country.code}&chart_params_chart_type=TRENDING_VIDEOS&chart_params_period_type=WEEKLY'
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        final contents = data['contents']?['sectionListRenderer']?['contents'];
        if (contents != null && contents.isNotEmpty) {
          final content = contents[0]['musicAnalyticsSectionRenderer']?['content'];
          if (content != null && content.containsKey('videos')) {
            final videosWrapper = content['videos'] as List<dynamic>;
            if (videosWrapper.isNotEmpty && videosWrapper[0] is Map<String, dynamic> && videosWrapper[0].containsKey('videoViews')) {
              return videosWrapper[0]['videoViews'] as List<dynamic>;
            }
          }
        }
        return [];
      } catch (e) {
        throw Exception('Failed to parse trending videos: $e');
      }
    } else {
      throw Exception('Failed to fetch charts: ${response.statusCode} - ${response.body}');
    }
  }

  /// Fetch top videos from YouTube Charts.
  /// [country] is optional. If provided, fetches charts for that country.
  /// If not provided, fetches global charts.
  Future<List<dynamic>> getTopVideos({
    YouTubeChartsCountry country = YouTubeChartsCountry.global, 
    String periodType = 'DAILY'
  }) async {
    final Map<String, dynamic> body = {
      'browseId': 'FEmusic_analytics_charts_home',
      'context': {
        'client': {
          'clientName': 'WEB_MUSIC_ANALYTICS',
          'clientVersion': '2.0',
          'hl': 'en',
          'gl': country == YouTubeChartsCountry.global ? 'US' : country.code.toUpperCase(),
        }
      },
      'query': 'flags=MusicCharts__enable_apac_and_shorts_charts_expansion&perspective=CHART_DETAILS&chart_params_country_code=${country.code}&chart_params_chart_type=VIDEOS&chart_params_period_type=$periodType'
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        final contents = data['contents']?['sectionListRenderer']?['contents'];
        if (contents != null && contents.isNotEmpty) {
          final content = contents[0]['musicAnalyticsSectionRenderer']?['content'];
          if (content != null && content.containsKey('videos')) {
            final videosWrapper = content['videos'] as List<dynamic>;
            if (videosWrapper.isNotEmpty && videosWrapper[0] is Map<String, dynamic> && videosWrapper[0].containsKey('videoViews')) {
              return videosWrapper[0]['videoViews'] as List<dynamic>;
            }
          }
        }
        return [];
      } catch (e) {
        throw Exception('Failed to parse top videos: $e');
      }
    } else {
      throw Exception('Failed to fetch top videos: ${response.statusCode} - ${response.body}');
    }
  }

  /// Fetch top songs from YouTube Charts.
  /// [country] is optional. If provided, fetches charts for that country.
  /// If not provided, fetches global charts.
  Future<List<dynamic>> getTopSongs({
    YouTubeChartsCountry country = YouTubeChartsCountry.global, 
    String periodType = 'WEEKLY'
  }) async {
    final Map<String, dynamic> body = {
      'browseId': 'FEmusic_analytics_charts_home',
      'context': {
        'client': {
          'clientName': 'WEB_MUSIC_ANALYTICS',
          'clientVersion': '2.0',
          'hl': 'en',
          'gl': country == YouTubeChartsCountry.global ? 'US' : country.code.toUpperCase(),
        }
      },
      'query': 'flags=MusicCharts__enable_apac_and_shorts_charts_expansion&perspective=CHART_DETAILS&chart_params_country_code=${country.code}&chart_params_chart_type=TRACKS&chart_params_period_type=$periodType'
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        final contents = data['contents']?['sectionListRenderer']?['contents'];
        if (contents != null && contents.isNotEmpty) {
          final content = contents[0]['musicAnalyticsSectionRenderer']?['content'];
          if (content != null && content.containsKey('trackTypes')) {
            final tracksWrapper = content['trackTypes'] as List<dynamic>;
            if (tracksWrapper.isNotEmpty && tracksWrapper[0] is Map<String, dynamic> && tracksWrapper[0].containsKey('trackViews')) {
              return tracksWrapper[0]['trackViews'] as List<dynamic>;
            }
          }
        }
        return [];
      } catch (e) {
        throw Exception('Failed to parse top songs: $e');
      }
    } else {
      throw Exception('Failed to fetch top songs: ${response.statusCode} - ${response.body}');
    }
  }

  /// Fetch top artists from YouTube Charts.
  /// [country] is optional. If provided, fetches charts for that country.
  /// If not provided, fetches global charts.
  Future<List<dynamic>> getTopArtists({
    YouTubeChartsCountry country = YouTubeChartsCountry.global, 
    String periodType = 'WEEKLY'
  }) async {
    final Map<String, dynamic> body = {
      'browseId': 'FEmusic_analytics_charts_home',
      'context': {
        'client': {
          'clientName': 'WEB_MUSIC_ANALYTICS',
          'clientVersion': '2.0',
          'hl': 'en',
          'gl': country == YouTubeChartsCountry.global ? 'US' : country.code.toUpperCase(),
        }
      },
      'query': 'flags=MusicCharts__enable_apac_and_shorts_charts_expansion&perspective=CHART_DETAILS&chart_params_country_code=${country.code}&chart_params_chart_type=ARTISTS&chart_params_period_type=$periodType'
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        final contents = data['contents']?['sectionListRenderer']?['contents'];
        if (contents != null && contents.isNotEmpty) {
          final content = contents[0]['musicAnalyticsSectionRenderer']?['content'];
          if (content != null && content.containsKey('artists')) {
            final artistsWrapper = content['artists'] as List<dynamic>;
            if (artistsWrapper.isNotEmpty && artistsWrapper[0] is Map<String, dynamic> && artistsWrapper[0].containsKey('artistViews')) {
              return artistsWrapper[0]['artistViews'] as List<dynamic>;
            }
          }
        }
        return [];
      } catch (e) {
        throw Exception('Failed to parse top artists: $e');
      }
    } else {
      throw Exception('Failed to fetch top artists: ${response.statusCode} - ${response.body}');
    }
  }

  /// Fetch Moods and Genres from YouTube Music.
  /// This returns a list of sections (e.g. "Moods & moments" and "Genres").
  /// Each section contains a 'title' and a list of 'items' (categories).
  Future<List<Map<String, dynamic>>> getMoodsAndGenres({
    YouTubeChartsCountry country = YouTubeChartsCountry.global, 
  }) async {
    final Map<String, dynamic> body = {
      'browseId': 'FEmusic_moods_and_genres',
      'context': {
        'client': {
          'clientName': 'WEB_REMIX',
          'clientVersion': '1.20240101.01.00',
          'hl': 'en',
          'gl': country == YouTubeChartsCountry.global ? 'US' : country.code.toUpperCase(),
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

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        final contents = data['contents']?['singleColumnBrowseResultsRenderer']?['tabs']?[0]?['tabRenderer']?['content']?['sectionListRenderer']?['contents'];
        
        List<Map<String, dynamic>> results = [];
        if (contents != null) {
          for (var section in contents) {
            if (section.containsKey('gridRenderer')) {
              final grid = section['gridRenderer'];
              final header = grid['header']?['gridHeaderRenderer']?['title']?['runs']?[0]?['text'] ?? 'Unknown Section';
              final items = grid['items'] as List<dynamic>? ?? [];
              
              results.add({
                'title': header,
                'items': items,
              });
            }
          }
        }
        return results;
      } catch (e) {
        throw Exception('Failed to parse moods and genres: $e');
      }
    } else {
      throw Exception('Failed to fetch moods and genres: ${response.statusCode} - ${response.body}');
    }
  }

  /// Fetch playlists for a specific mood or genre category.
  /// You can get the [params] from the items returned by [getMoodsAndGenres].
  Future<List<Map<String, dynamic>>> getPlaylistsForCategory(String params) async {
    final Map<String, dynamic> body = {
      'browseId': 'FEmusic_moods_and_genres_category',
      'params': params,
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

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        final contents = data['contents']?['singleColumnBrowseResultsRenderer']?['tabs']?[0]?['tabRenderer']?['content']?['sectionListRenderer']?['contents'];
        
        List<Map<String, dynamic>> results = [];
        if (contents != null) {
          for (var section in contents) {
            String? title;
            List<dynamic> items = [];

            if (section.containsKey('gridRenderer')) {
              final grid = section['gridRenderer'];
              title = grid['header']?['gridHeaderRenderer']?['title']?['runs']?[0]?['text'];
              items = grid['items'] as List<dynamic>? ?? [];
            } else if (section.containsKey('musicCarouselShelfRenderer')) {
              final shelf = section['musicCarouselShelfRenderer'];
              title = shelf['header']?['musicCarouselShelfBasicHeaderRenderer']?['title']?['runs']?[0]?['text'];
              items = shelf['contents'] as List<dynamic>? ?? [];
            }

            if (title != null && items.isNotEmpty) {
              results.add({
                'title': title,
                'items': items,
              });
            }
          }
        }
        return results;
      } catch (e) {
        throw Exception('Failed to parse category playlists: $e');
      }
    } else {
      throw Exception('Failed to fetch category playlists: ${response.statusCode} - ${response.body}');
    }
  }

  /// Fetch tracks from a specific playlist.
  /// The [playlistId] can be obtained from the items returned by [getPlaylistsForCategory].
  Future<List<Map<String, dynamic>>> getPlaylistDetails(String playlistId) async {
    final Map<String, dynamic> body = {
      'browseId': playlistId.startsWith('VL') ? playlistId : 'VL$playlistId',
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

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        final contents = data['contents']?['twoColumnBrowseResultsRenderer']?['secondaryContents']?['sectionListRenderer']?['contents'];
        
        List<Map<String, dynamic>> results = [];
        if (contents != null && contents.isNotEmpty) {
          final playlistContents = contents[0]['musicPlaylistShelfRenderer']?['contents'] as List<dynamic>?;
          if (playlistContents != null) {
            for (var item in playlistContents) {
              if (item.containsKey('musicResponsiveListItemRenderer')) {
                results.add(item['musicResponsiveListItemRenderer']);
              }
            }
          }
        }
        return results;
      } catch (e) {
        throw Exception('Failed to parse playlist details: $e');
      }
    } else {
      throw Exception('Failed to fetch playlist details: ${response.statusCode} - ${response.body}');
    }
  }
}
