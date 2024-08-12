import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/is_favorite_song.dart';

import '../../../service_locator.dart';
import '../../models/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();

  Future<Either> addOrRemoveFavoriteSongs(String songId);

  Future<bool> isFavoriteSong(String songId);
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
        bool isFavorite =
            await sl<IsFavoriteSongUseCase>().call(params: doc.reference.id);
        songModel.isFavorite = isFavorite;
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
          .get();
      for (var doc in data.docs) {
        var songModel = SongModel.fromJson(doc.data());
        bool isFavorite =
            await sl<IsFavoriteSongUseCase>().call(params: doc.reference.id);
        songModel.isFavorite = isFavorite;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      debugPrint(e.toString());
      return const Left('An error occurred while fetching playlist');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    try {
      late bool isFavorite;
      String uId = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot favoriteSongs = await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('favoriteSongs')
          .where('songId', isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .collection('favoriteSongs')
            .doc(songId)
            .set({
          'songId': songId,
          'addedAt': FieldValue.serverTimestamp(),
        });
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      debugPrint(e.toString());
      return const Left(
          'An error occurred while adding/removing favorite songs');
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    try {
      String uId = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot favoriteSongs = await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('favoriteSongs')
          .where('songId', isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
