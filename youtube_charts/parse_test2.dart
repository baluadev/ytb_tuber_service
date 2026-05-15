import 'package:youtube_charts/youtube_charts.dart';
void main() async {
  final client = YouTubeChartsClient();
  final data = await client.getTrendingIn(country: YouTubeChartsCountry.vn);
  print(data.length);
  print(data[0].keys);
}
