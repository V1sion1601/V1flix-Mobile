import 'package:app/src/models/series.dart';

defaultImage (String type) {
  return "http://res.cloudinary.com/dgcvss8u6/image/upload/v1/anime-v2/$type/default-$type";
}
findImage(List images, String type) {
  if (type != "cover" && type != "thumbnail" && type != "banner") return defaultImage(type);
  if (images.isEmpty) return defaultImage(type);
  Map result = images.firstWhere((img) => img["type"] == type);
  if (result["source"] == "") return defaultImage(type);
  return result["source"];
}