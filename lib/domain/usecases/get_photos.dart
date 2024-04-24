import 'package:mobile_challenge/core/usecase/usecase.dart';
import 'package:mobile_challenge/core/utils/typedef.dart';
import 'package:mobile_challenge/domain/entity/photo.dart';
import 'package:mobile_challenge/domain/repositories/photos_repository.dart';

class GetPhotosParams {
  final int page;

  const GetPhotosParams(this.page);
}

class GetPhotos extends UsecaseWithParams<List<Photo>, GetPhotosParams> {
  const GetPhotos(this._photosRepository);

  final PhotosRepository _photosRepository;

  @override
  ResultFuture<List<Photo>> call(GetPhotosParams params) async =>
      _photosRepository.getPhotos(params);
}
