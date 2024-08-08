import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

import '../../models/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();
      for (var doc in data.docs) {
        var songModel = SongModel.fromJson(doc.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      debugPrint(e.toString());
      return const Left('An error occurred while fetching songs');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      for (var doc in data.docs) {
        var songModel = SongModel.fromJson(doc.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      debugPrint(e.toString());
      return const Left('An error occurred while fetching playlist');
    }
  }
}
