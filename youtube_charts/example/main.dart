import 'package:youtube_charts/youtube_charts.dart';

void main() async {
  final client = YouTubeChartsClient();
  
  try {
    print('\nFetching Vietnam trending videos...');
    final vnTrending = await client.getTrendingIn(country: YouTubeChartsCountry.vn);
    print('VN trending videos fetched successfully. Count: ${vnTrending.length}');
    if (vnTrending.isNotEmpty) {
      print('First VN trending video: ${vnTrending[0]['title']}');
    }
    
    print('\nFetching Vietnam Top Videos (Daily)...');
    final vnTopVideos = await client.getTopVideos(country: YouTubeChartsCountry.vn, periodType: 'DAILY');
    print('VN Top Videos fetched successfully. Count: ${vnTopVideos.length}');
    if (vnTopVideos.isNotEmpty) {
      print('First VN Top Video: ${vnTopVideos[0]['title']}');
    }

    print('\nFetching Vietnam Top Songs (Weekly)...');
    final vnTopSongs = await client.getTopSongs(country: YouTubeChartsCountry.vn, periodType: 'WEEKLY');
    print('VN Top Songs fetched successfully. Count: ${vnTopSongs.length}');
    if (vnTopSongs.isNotEmpty) {
      print('First VN Top Song: ${vnTopSongs[0]['name']}');
    }

    print('\nFetching Vietnam Top Artists (Weekly)...');
    final vnTopArtists = await client.getTopArtists(country: YouTubeChartsCountry.vn, periodType: 'WEEKLY');
    print('VN Top Artists fetched successfully. Count: ${vnTopArtists.length}');
    if (vnTopArtists.isNotEmpty) {
      print('First VN Top Artist: ${vnTopArtists[0]['name']}');
    }

    print('\nFetching Moods & Genres...');
    final moodsAndGenres = await client.getMoodsAndGenres(country: YouTubeChartsCountry.vn);
    print('Moods & Genres fetched successfully. Found ${moodsAndGenres.length} sections.');
    
    String? sampleParams;
    for (var section in moodsAndGenres) {
      print(' - ${section['title']} (${section['items'].length} items)');
      if (section['items'].isNotEmpty) {
        final firstItem = section['items'][0]['musicNavigationButtonRenderer'];
        final firstItemTitle = firstItem?['buttonText']?['runs']?[0]?['text'];
        final params = firstItem?['clickCommand']?['browseEndpoint']?['params'];
        print('   Example: $firstItemTitle (Params: $params)');
        
        // Save the first params we find to test getPlaylistsForCategory
        if (sampleParams == null && params != null) {
          sampleParams = params;
        }
      }
    }

    String? samplePlaylistId;
    if (sampleParams != null) {
      print('\nFetching Playlists for Category (params: $sampleParams)...');
      final categoryPlaylists = await client.getPlaylistsForCategory(sampleParams);
      print('Category Playlists fetched successfully. Found ${categoryPlaylists.length} sections.');
      for (var section in categoryPlaylists) {
        print(' - ${section['title']} (${section['items'].length} items)');
        if (section['items'].isNotEmpty) {
          final firstItem = section['items'][0]['musicTwoRowItemRenderer'];
          final firstItemTitle = firstItem?['title']?['runs']?[0]?['text'];
          final browseId = firstItem?['navigationEndpoint']?['browseEndpoint']?['browseId'];
          print('   Example Playlist: $firstItemTitle (ID: $browseId)');
          
          if (samplePlaylistId == null && browseId != null) {
            samplePlaylistId = browseId;
          }
        }
      }
    }

    if (samplePlaylistId != null) {
      print('\nFetching Tracks for Playlist (ID: $samplePlaylistId)...');
      final playlistTracks = await client.getPlaylistDetails(samplePlaylistId);
      print('Playlist Tracks fetched successfully. Found ${playlistTracks.length} tracks.');
      if (playlistTracks.isNotEmpty) {
        final firstTrack = playlistTracks[0];
        final title = firstTrack['flexColumns']?[0]?['musicResponsiveListItemFlexColumnRenderer']?['text']?['runs']?[0]?['text'];
        print('   First Track: $title');
      }
    }
  
  } catch (e) {
    print('Error: $e');
  }
}
