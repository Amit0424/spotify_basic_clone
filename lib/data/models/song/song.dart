import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  String? id;
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  String? imageUrl;
  String? url;
  bool? isFavorite;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.imageUrl,
    required this.url,
    required this.isFavorite,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    imageUrl = data['imageUrl'];
    url = data['url'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      id: id!,
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      imageUrl: imageUrl!,
      url: url!,
      isFavorite: isFavorite!,
    );
  }
}
