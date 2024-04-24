import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:mobile_challenge/domain/entity/photo.dart';
import 'package:mobile_challenge/domain/usecases/get_photos.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final GetPhotos _getPhotos;
  int _currentPage = 1;
  bool _hasReachedMax = false;

  PhotosBloc({
    required GetPhotos getPhotos,
  })  : _getPhotos = getPhotos,
        super(const PhotosInitial()) {
    on<LoadPhotosEvent>(_onGetPhotosEvent);
    on<LoadMorePhotosEvent>(_onLoadMorePhotos);
  }

  Future<void> _onGetPhotosEvent(
    LoadPhotosEvent event,
    Emitter<PhotosState> emit,
  ) async {
    _currentPage = 1;
    emit(const PhotosLoading());

    final photos = await _getPhotos(GetPhotosParams(_currentPage));

    photos.fold(
      (failure) => emit(PhotosError(errorMessage: failure.errorMessage)),
      (photos) => emit(PhotosLoadSuccess(photos: photos)),
    );

    _currentPage++;
  }

  Future<void> _onLoadMorePhotos(
    LoadMorePhotosEvent event,
    Emitter<PhotosState> emit,
  ) async {
    if (state is PhotosLoadingMore) return;
    emit(PhotosLoadingMore(event.currentPhotos));

    final result = await _getPhotos(GetPhotosParams(_currentPage));
    result.fold(
      (failure) => emit(PhotosError(errorMessage: failure.errorMessage)),
      (photos) => emit(PhotosLoadSuccess(
          photos: [...event.currentPhotos, ...photos],
          hasReachedMax: photos.length < 15)),
    );
    _currentPage++;
  }
}
