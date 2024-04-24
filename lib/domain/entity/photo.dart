import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  const Photo({
    required this.id,
    required this.owner,
    required this.title,
    required this.url,
  });

  const Photo.empty()
      : this(
          id: '1',
          owner: '_empty.owner',
          title: '_empty.title',
          url: '_empty.url',
        );

  final String id;
  final String owner;
  final String title;
  final String url;

  @override
  List<Object?> get props => [
        id,
        owner,
        owner,
        url,
      ];
}
