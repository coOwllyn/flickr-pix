import 'package:mobile_challenge/core/utils/typedef.dart';
import 'package:mobile_challenge/domain/entity/photo.dart';
import 'package:mobile_challenge/domain/usecases/get_photos.dart';

abstract class PhotosRepository {
  const PhotosRepository();

  ResultFuture<List<Photo>> getPhotos(GetPhotosParams params);
}
