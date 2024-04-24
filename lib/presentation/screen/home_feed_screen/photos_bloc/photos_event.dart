part of 'photos_bloc.dart';

class PhotosEvent extends Equatable {
  const PhotosEvent();

  @override
  List<Object?> get props => [];
}

class LoadPhotosEvent extends PhotosEvent {
  const LoadPhotosEvent();

  @override
  List<Object?> get props => [];
}

class LoadMorePhotosEvent extends PhotosEvent {
  const LoadMorePhotosEvent(this.currentPhotos);

  final List<Photo> currentPhotos;
  @override
  List<Object?> get props => [currentPhotos];
}

class FetchMorePhotos extends PhotosEvent {
  const FetchMorePhotos();

  @override
  List<Object?> get props => [];
}
