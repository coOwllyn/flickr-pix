import 'package:dartz/dartz.dart';

import 'package:mobile_challenge/core/errors/exceptions.dart';
import 'package:mobile_challenge/core/errors/failure.dart';
import 'package:mobile_challenge/core/utils/typedef.dart';
import 'package:mobile_challenge/data/datasources/photos_remote_data_source.dart';
import 'package:mobile_challenge/domain/entity/photo.dart';
import 'package:mobile_challenge/domain/repositories/photos_repository.dart';
import 'package:mobile_challenge/domain/usecases/get_photos.dart';

class PhotosRepositoryImplementation implements PhotosRepository {
  const PhotosRepositoryImplementation(this._remoteDataSource);

  final PhotosRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Photo>> getPhotos(GetPhotosParams params) async {
    try {
      final result = await _remoteDataSource.getPhotos(page: params.page);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
