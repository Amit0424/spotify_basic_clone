import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  final String id;
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String imageUrl;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.imageUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> data) {
    return SongModel(
      id: data['id'],
      title: data['title'],
      artist: data['artist'],
      duration: data['duration'],
      releaseDate: data['releaseDate'],
      imageUrl: data['imageUrl'],
    );
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      id: id,
      title: title,
      artist: artist,
      duration: duration,
      releaseDate: releaseDate,
      imageUrl: imageUrl,
    );
  }
}
