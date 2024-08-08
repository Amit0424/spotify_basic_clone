import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/sources/songs/song_firebase_service.dart';

import '../../../domain/repository/song/song.dart';
import '../../../service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }
}
