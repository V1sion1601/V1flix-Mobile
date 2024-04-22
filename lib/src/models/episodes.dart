import 'package:app/src/models/series.dart';
import 'package:app/src/models/source.dart';

class SubtitleSeriesSource {
  final String id;
  final String kind;
  final String value;

  SubtitleSeriesSource(
      {required this.id, required this.kind, required this.value});

  static SubtitleSeriesSource fromMap({required Map source}) {
    return SubtitleSeriesSource(
        id: source["_id"], kind: source["kind"], value: source["value"]);
  }
}

class SubtitleSeries {
  final String lang;
  final List<SubtitleSeriesSource> sources;
  final String label;

  SubtitleSeries(
      {required this.lang, required this.sources, required this.label});

  static SubtitleSeries fromMap({required Map subtitle}) {
    List<SubtitleSeriesSource> sources = [];
    if (subtitle["source"] != null) {
      sources = subtitle["source"]
          .map((src) => SubtitleSeriesSource.fromMap(source: src))
          .toList()
          .cast<SubtitleSeriesSource>();
    }
    return SubtitleSeries(
        lang: subtitle["lang"], sources: sources, label: subtitle["label"]);
  }
}

class Episode {
  final String id;
  final String title;
  final int epNum;
  final int? view;
  final List<Source?>? sources;
  final String? description;
  final String? thumbnail;
  final Series? series;
  final List<SubtitleSeries>? subtitles;

  Episode(
      {required this.id,
      required this.title,
      required this.epNum,
      this.view,
      this.sources,
      this.description,
      this.thumbnail,
      this.series,
      this.subtitles});

  static Episode fromMap({required Map episodes}) {
    List<Source> sources = [];
    List<SubtitleSeries> subtitles = [];
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

    if (episodes["subtitles"] != null) {
      subtitles = episodes["subtitles"]
          .map((sub) => SubtitleSeries.fromMap(subtitle: sub))
          .toList()
          .cast<SubtitleSeries>();
    }

    return Episode(
        id: episodes["_id"],
        title: episodes["title"],
        epNum: episodes["epNum"],
        view: episodes["view"],
        sources: sources,
        description: episodes["description"],
        thumbnail: episodes["thumbnail"],
        series: series,
        subtitles: subtitles);
  }
}
