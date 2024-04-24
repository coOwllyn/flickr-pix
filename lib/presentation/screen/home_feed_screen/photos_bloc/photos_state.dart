part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {
  const PhotosInitial();
}

class PhotosLoading extends PhotosState {
  const PhotosLoading();
}

class PhotosLoadingMore extends PhotosState {
  const PhotosLoadingMore(this.photos);
  final List<Photo> photos;

  @override
  List<Object> get props => photos.map((photo) => photo.id).toList();
}

class PhotosLoadSuccess extends PhotosState {
  const PhotosLoadSuccess({required this.photos, this.hasReachedMax = false});

  final List<Photo> photos;
  final bool hasReachedMax;

  @override
  List<Object> get props => photos.map((photo) => photo.id).toList();
}

class PhotosError extends PhotosState {
  const PhotosError({required this.errorMessage});

  final String errorMessage;

  @override
  List<String> get props => [errorMessage];
}
