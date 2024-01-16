import 'package:app/src/models/episodes.dart';

class Title {
  final String mainTitle;
  final String altTitle;

  Title(this.mainTitle, this.altTitle);
}

class SeriesImage {
  final String id;
  final String type;
  final String source;

  SeriesImage(this.id, this.type, this.source);

  static SeriesImage fromMap({required Map image}) =>
      SeriesImage(image["_id"], image["type"], image["source"]);
}

class Series {
  final String id;
  final Title title;
  final int? duration;
  final int? totalEpisodes;
  final String? type;
  final String? season;
  final String? status;
  final int? view;
  final List<SeriesImage> images;
  final double? updatedAt;
  final double? createdAt;
  final String? description;
  final List<Episode>? episodes;

  Series(
      {required this.id,
      required this.title,
      required this.images,
      this.duration,
      this.totalEpisodes,
      this.description,
      this.type,
      this.season,
      this.status,
      this.view,
      this.updatedAt,
      this.createdAt,
      this.episodes});

  static Series fromMap({required Map map}) {
    List<Episode> episodes = [];
    List<SeriesImage> images = [];

    if (map["episodes"] != null) {
      episodes = map["episodes"]
          .map((ep) => Episode.fromMap(episodes: ep))
          .toList()
          .cast<Episode>();
    }

    if (map["images"] != null) {
      images = map["images"]
          .map((img) => SeriesImage.fromMap(image: img))
          .toList()
          .cast<SeriesImage>();
    }

    return Series(
        id: map["_id"],
        title: Title(map["title"]["main_title"], map["title"]["alt_title"]),
        images: images,
        duration: map["duration"],
        totalEpisodes: map["total_episodes"],
        type: map["type"],
        season: map["season"],
        status: map["status"],
        view: map["view"],
        description: map["description"],
        updatedAt: map["updatedAt"],
        createdAt: map["createdAt"],
        episodes: episodes);
  }
}
