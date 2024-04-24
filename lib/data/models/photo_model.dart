import 'dart:convert';

import 'package:mobile_challenge/core/utils/typedef.dart';
import 'package:mobile_challenge/domain/entity/photo.dart';

class PhotoModel extends Photo {
  const PhotoModel({
    required super.id,
    required super.owner,
    required super.title,
    required super.url,
  });

  const PhotoModel.empty()
      : this(
          id: '1',
          owner: '_empty.ownername',
          title: '_empty.title',
          url: '_empty.url',
        );

  factory PhotoModel.fromJson(String source) =>
      PhotoModel.fromMap(jsonDecode(source) as DataMap);

  PhotoModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          owner: map['ownername'] as String,
          title: map['title'] as String,
          url: map['url_s'] as String,
        );

  PhotoModel copyWith({
    String? id,
    String? owner,
    String? title,
    String? url,
  }) {
    return PhotoModel(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  DataMap toMap() => {
        'id': id,
        'ownername': owner,
        'title': title,
        'url_s': url,
      };

  String toJson() => jsonEncode(toMap());
}
