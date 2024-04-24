import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_challenge/core/resources/app_strings.dart';
import 'package:mobile_challenge/domain/entity/photo.dart';
import 'package:mobile_challenge/presentation/screen/home_feed_screen/photos_bloc/photos_bloc.dart';
import 'package:mobile_challenge/presentation/screen/home_feed_screen/widgets/photo_form.dart';
import 'package:mobile_challenge/presentation/style/app_colors.dart';
import 'package:mobile_challenge/presentation/widgets/loading_column.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({
    super.key,
    required this.photos,
    required this.isLoadingMore,
  });

  final List<Photo> photos;
  final bool isLoadingMore;

  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    _listScrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _listScrollController.position.maxScrollExtent;
    final currentScroll = _listScrollController.position.pixels;
    final scrollThreshold = maxScroll * 0.95;

    if (currentScroll > scrollThreshold && !widget.isLoadingMore) {
      context.read<PhotosBloc>().add(LoadMorePhotosEvent(widget.photos));
    }
  }

  @override
  Widget build(BuildContext context) {
    final photosBloc = BlocProvider.of<PhotosBloc>(context);

    return RefreshIndicator(
      onRefresh: () async {
        photosBloc.add(const LoadPhotosEvent());
      },
      color: AppColors.greenMain,
      backgroundColor: AppColors.bgLight,
      child: Center(
        child: ListView.builder(
          controller: _listScrollController,
          padding: const EdgeInsets.only(top: 10),
          itemCount: widget.isLoadingMore
              ? widget.photos.length + 1
              : widget.photos.length,
          itemBuilder: (context, index) {
            if (index == (widget.photos.length)) {
              return const SizedBox(
                  height: 200,
                  child: LoadingColumn(message: AppStrings.loadingPhotos));
            } else {
              final photo = widget.photos[index];
              return PhotoForm(
                title: photo.title,
                image: photo.url,
                owner: photo.owner,
              );
            }
          },
        ),
      ),
    );
  }
}
