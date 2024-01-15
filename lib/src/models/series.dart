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
  final List images;
  final double? updatedAt;
  final double? createdAt;

  Series(
      {required this.id,
      required this.title,
      required this.images,
      this.duration,
      this.totalEpisodes,
      this.type,
      this.season,
      this.status,
      this.view,
      this.updatedAt,
      this.createdAt});

  static Series fromMap({required Map map}) {
    return Series(
        id: map["_id"],
        title: Title(map["title"]["main_title"], map["title"]["alt_title"]),
        images: map["images"],
        duration: map["duration"],
        totalEpisodes: map["total_episodes"],
        type: map["type"],
        season: map["season"],
        status: map["status"],
        view: map["view"],
        updatedAt: map["updatedAt"],
        createdAt: map["createdAt"]);
  }
}
