import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_challenge/core/resources/app_strings.dart';
import 'package:mobile_challenge/presentation/screen/home_feed_screen/photos_bloc/photos_bloc.dart';
import 'package:mobile_challenge/presentation/screen/home_feed_screen/widgets/photo_list.dart';
import 'package:mobile_challenge/presentation/style/app_colors.dart';
import 'package:mobile_challenge/presentation/widgets/loading_column.dart';

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void getPhotos() {
      context.read<PhotosBloc>().add(const LoadPhotosEvent());
    }

    return Scaffold(
        backgroundColor: AppColors.bgLight,
        appBar: AppBar(
          title: const Text(AppStrings.taskifyPix),
          centerTitle: true,
          backgroundColor: AppColors.bgLight,
          scrolledUnderElevation: 0,
        ),
        body: BlocConsumer<PhotosBloc, PhotosState>(
          listener: (context, state) {
            if (state is PhotosError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            } else if (state is PhotosInitial) {
              getPhotos();
            }
          },
          builder: (context, state) {
            if (state is PhotosLoading) {
              return const LoadingColumn(message: AppStrings.loadingPhotos);
            }
            if (state is PhotosLoadSuccess) {
              return PhotoList(photos: state.photos, isLoadingMore: false);
            }
            if (state is PhotosLoadingMore) {
              return PhotoList(photos: state.photos, isLoadingMore: true);
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
