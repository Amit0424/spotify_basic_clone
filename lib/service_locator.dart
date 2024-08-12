import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_clone/domain/usecases/song/get_play_list.dart';

import 'data/repository/auth/auth_repository_impl.dart';
import 'domain/repository/song/song.dart';
import 'domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<AuthFirebaseService>(
      () => AuthFirebaseServiceImpl());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase());
  sl.registerLazySingleton<SongFirebaseService>(
      () => SongFirebaseServiceImpl());
  sl.registerLazySingleton<SongRepository>(() => SongRepositoryImpl());
  sl.registerLazySingleton<GetNewsSongsUseCase>(() => GetNewsSongsUseCase());
  sl.registerLazySingleton<GetPlayListUseCase>(() => GetPlayListUseCase());
  sl.registerLazySingleton<AddOrRemoveFavoriteSongUseCase>(
      () => AddOrRemoveFavoriteSongUseCase());
  sl.registerLazySingleton<IsFavoriteSongUseCase>(
      () => IsFavoriteSongUseCase());
}
