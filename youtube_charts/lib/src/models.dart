class YouTubeChartResult {
  final Map<String, dynamic> rawData;

  YouTubeChartResult(this.rawData);

  // Simplified access to charts, depending on how users want to consume it.
  // In a full implementation, you could parse videos, artists, etc.
}
