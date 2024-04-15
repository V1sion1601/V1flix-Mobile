class ListUpdateResult {
  final String error;
  final bool result;
  final String? message;
  ListUpdateResult({required this.error, required this.result, this.message});
}

class ListInput {
  final String score;
  final String status;
  final String currentEpisode;
  final String seriesId;
  final String userId;
  ListInput({required this.userId, required this.score, required this.status, required this.currentEpisode, required this.seriesId});
}