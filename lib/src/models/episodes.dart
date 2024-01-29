import 'package:app/src/models/source.dart';

class Episode {
  final String id;
  final String title;
  final int epNum;
  final int view;
  final List<Source?>? sources;
  final String description;
  final String thumbnail;
  Episode({required this.id, required this.title, required this.epNum, required this.view, this.sources, required this.description, required this.thumbnail});

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
      description: episodes["description"],
      thumbnail: episodes["thumbnail"]
    );
  }
}
