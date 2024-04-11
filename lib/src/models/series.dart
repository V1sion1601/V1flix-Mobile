import 'package:app/src/models/episodes.dart';
import 'package:app/src/models/users.dart';

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
  final String? site;
  final String? thumbnail;
  final String? idTrailer;

  Trailer(this.site, this.thumbnail, this.idTrailer);

  static Trailer fromMap({required Map trailer}) =>
      Trailer(trailer["site"], trailer["thumbnail"], trailer["idTrailer"]);
}

class Relation {
  final String? role;
  final Series? series;

  Relation(this.role, this.series);

  static Relation fromMap({required Map relation}) =>
      Relation(relation["role"], Series.fromMap(map: relation["related_series"]));
}

class SeriesImage {
  final String? id;
  final String? type;
  final String? source;

  SeriesImage(this.id, this.type, this.source);

  static SeriesImage fromMap({required Map image}) =>
      SeriesImage(image["_id"], image["type"], image["source"]);
}

class Rating {
  final Users user;
  final int score;

  Rating({required this.user, required this.score});

  static Rating fromMap({required Map rating}) {
    return Rating(
        user: Users.fromMap(user: rating["user"]), score: rating["score"]);
  }
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
  final List<Trailer>? trailer;
  final double? avgScore;
  final List<Genres>? genres;
  final List<Rating>? rating;
  final List<Relation>? relation;

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
      this.genres,
      this.rating,
      this.relation});

  static Series fromMap({required Map map}) {
    List<Episode> episodes = [];
    List<SeriesImage> images = [];
    List<Genres> genres = [];
    List<Rating> rating = [];
    double score = 0;
    List<Trailer> trailer = [];
    SeriesTitle title = SeriesTitle("", "");
    List<Relation> relation = [];

    if (map["title"] != null) {
      title =
          SeriesTitle(map["title"]["main_title"], map["title"]["alt_title"]);
    }

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
      trailer = map["trailer"]
          .map((trailer) => Trailer.fromMap(trailer: trailer))
          .toList()
          .cast<Trailer>();
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

    if (map["rating"] != null) {
      rating = List<Rating>.from(
          map["rating"].map((rating) => Rating.fromMap(rating: rating)));
    }

    if (map["relation"] != null) {
      relation = map["relation"]
          .map((relation) => Relation.fromMap(relation: relation))
          .toList()
          .cast<Relation>();
    }

    return Series(
        id: map["_id"],
        title: title,
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
        rating: rating,
        relation: relation);
  }
}
