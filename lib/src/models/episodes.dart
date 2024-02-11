import 'package:app/src/models/series.dart';
import 'package:app/src/models/source.dart';

class Episode {
  final String id;
  final String title;
  final int epNum;
  final int? view;
  final List<Source?>? sources;
  final String? description;
  final String? thumbnail;
  final Series? series;

  Episode(
      {required this.id,
      required this.title,
      required this.epNum,
      this.view,
      this.sources,
      this.description,
      this.thumbnail,
      this.series});

  static Episode fromMap({required Map episodes}) {
    List<Source> sources = [];
    Series series = Series(id: "", title: SeriesTitle("", ""));
    if (episodes["source"] != null) {
      sources = episodes["source"]
          .map((src) => Source.fromMap(sources: src))
          .toList()
          .cast<Source>();
    }

    if (episodes["series"] != null) {
      series = Series.fromMap(map: episodes["series"]);
    }

    return Episode(
        id: episodes["_id"],
        title: episodes["title"],
        epNum: episodes["epNum"],
        view: episodes["view"],
        sources: sources,
        description: episodes["description"],
        thumbnail: episodes["thumbnail"],
        series: series);
  }
}
