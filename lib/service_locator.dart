import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_songs.dart';

import 'data/repository/auth/auth_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<AuthFirebaseService>(
      () => AuthFirebaseServiceImpl());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase());
  sl.registerLazySingleton<SongFirebaseService>(
      () => SongFirebaseServiceImpl());
  sl.registerLazySingleton<SongRepositoryImpl>(() => SongRepositoryImpl());
  sl.registerLazySingleton<GetNewsSongsUseCase>(() => GetNewsSongsUseCase());
}
