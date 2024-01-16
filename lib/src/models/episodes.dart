class Episode {
  final String id;
  final String title;
  final int epNum;
  final int view;

  Episode({required this.id, required this.title, required this.epNum, required this.view});

  static Episode fromMap({required Map episodes}) {
    return Episode(
      id: episodes["_id"],
      title: episodes["title"],
      epNum: episodes["epNum"],
      view: episodes["view"]
    );
  }
}
