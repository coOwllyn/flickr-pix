import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:mobile_challenge/core/errors/exceptions.dart';
import 'package:mobile_challenge/core/utils/app_consts.dart';
import 'package:mobile_challenge/data/models/photo_model.dart';

abstract class PhotosRemoteDataSource {
  Future<List<PhotoModel>> getPhotos({int page = 1});
}

const String perPage = "5";
const kApiKey = '0a596ff1adab5442a354557c0531a732';
const kGetPhotosEndpoint = '/services/rest/';
const Map<String, String> kGetPhotosParams = {
  'api_key': kApiKey,
  'method': 'flickr.photos.getRecent',
  // 'user_id': '135168164@N03',
  'format': 'json',
  'nojsoncallback': '1',
  'extras': 'url_s, owner_name',
  'per_page': perPage,
};

class PhotosRemoteDataSrcImpl implements PhotosRemoteDataSource {
  const PhotosRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<List<PhotoModel>> getPhotos({int page = 1}) async {
    try {
      final uri = Uri.https(kBaseUrl, kGetPhotosEndpoint,
          {...kGetPhotosParams, 'page': page.toString()});
      final response = await _client.get(uri);
      debugPrint('get photos ======  ${response.body}');
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      final List<dynamic> photos = decodedJson['photos']['photo'];
      return photos.map((photoData) => PhotoModel.fromMap(photoData)).toList();
    } on APIException catch (e) {
      throw APIException(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      debugPrint("$e");
      throw Exception("Unknown error occurred");
    }
  }
}
