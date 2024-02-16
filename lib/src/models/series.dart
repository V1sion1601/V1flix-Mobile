import 'package:app/src/models/episodes.dart';

class SeriesTitle {
  final String mainTitle;
  final String? altTitle;

  SeriesTitle(this.mainTitle, this.altTitle);
}

class Genres {
  final String? id;
  final String? name;

  Genres(this.id, this.name);

  static Genres fromMap({required Map genre}) =>
      Genres(genre["_id"], genre["name"]);
}

class Trailer {
  final String? id;
  final String? site;
  final String? thumbnail;

  Trailer(this.id, this.site, this.thumbnail);
}

class SeriesImage {
  final String? id;
  final String? type;
  final String? source;

  SeriesImage(this.id, this.type, this.source);

  static SeriesImage fromMap({required Map image}) =>
      SeriesImage(image["_id"], image["type"], image["source"]);
}

class Series {
  final String id;
  final SeriesTitle title;
  final int? duration;
  final int? totalEpisodes;
  final String? type;
  final String? season;
  final String? status;
  final int? view;
  final List<SeriesImage>? images;
  final double? updatedAt;
  final double? createdAt;
  final String? description;
  final List<Episode>? episodes;
  final Trailer? trailer;
  final double? avgScore;
  final List<Genres>? genres;

  Series(
      {required this.id,
      required this.title,
      this.images,
      this.duration,
      this.totalEpisodes,
      this.description,
      this.type,
      this.season,
      this.status,
      this.view,
      this.updatedAt,
      this.createdAt,
      this.episodes,
      this.trailer,
      this.avgScore,
      this.genres});

  static Series fromMap({required Map map}) {
    List<Episode> episodes = [];
    List<SeriesImage> images = [];
    List<Genres> genres = [];
    double score = 0;
    Trailer trailer = Trailer("", "", "");

    if (map["episodes"] != null) {
      if (map["episodes"].length == 0) episodes = [];
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

    if (map["trailer"] != null) {
      trailer = Trailer(map["trailer"]["id"], map["trailer"]["site"],
          map["trailer"]["thumbnail"]);
    }

    if (map["avg_score"] != null) {
      score = map["avg_score"].toDouble();
    }

    if (map["genres"] != null) {
      genres = map["genres"]
          .map((genre) => Genres.fromMap(genre: genre))
          .toList()
          .cast<Genres>();
    }

    return Series(
      id: map["_id"],
      title: SeriesTitle(map["title"]["main_title"], map["title"]["alt_title"]),
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
      episodes: episodes,
      trailer: trailer,
      avgScore: score,
      genres: genres,
    );
  }
}
