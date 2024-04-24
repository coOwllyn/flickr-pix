import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:mobile_challenge/data/datasources/photos_remote_data_source.dart';
import 'package:mobile_challenge/data/repositories/photos_repository_implementation.dart';
import 'package:mobile_challenge/domain/repositories/photos_repository.dart';
import 'package:mobile_challenge/domain/usecases/get_photos.dart';
import 'package:mobile_challenge/presentation/screen/home_feed_screen/photos_bloc/photos_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // App Logic
    ..registerFactory(() => PhotosBloc(
          getPhotos: sl(),
        ))

    // Use cases
    ..registerLazySingleton(() => GetPhotos(sl()))

    // Repositories
    ..registerLazySingleton<PhotosRepository>(
        () => PhotosRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<PhotosRemoteDataSource>(
        () => PhotosRemoteDataSrcImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
