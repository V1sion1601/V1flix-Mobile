import 'package:app/src/models/source.dart';

class Episode {
  final String id;
  final String title;
  final int epNum;
  final int view;
  final List<Source?>? sources;
  Episode({required this.id, required this.title, required this.epNum, required this.view, this.sources});

  static Episode fromMap({required Map episodes}) {
    List<Source> sources = [];
    if(episodes["source"] != null) {
      sources = episodes["source"]
          .map((src) => Source.fromMap(sources: src))
          .toList()
          .cast<Source>();
    }
    return Episode(
      id: episodes["_id"],
      title: episodes["title"],
      epNum: episodes["epNum"],
      view: episodes["view"],
      sources: sources,
    );
  }
}
