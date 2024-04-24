import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import 'package:mobile_challenge/data/datasources/photos_remote_data_source.dart';
import 'package:mobile_challenge/core/errors/exceptions.dart';
import 'package:mobile_challenge/core/utils/app_consts.dart';
import 'package:mobile_challenge/data/models/photo_model.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late PhotosRemoteDataSource remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = PhotosRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group('getPhotos', () {
    const tPhotos = [PhotoModel.empty()];
    test(
      'should return [List<Photo>] when the status code is 200',
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async => http.Response(
              jsonEncode({
                "photos": {
                  "photo": [tPhotos.first.toMap()]
                }
              }),
              200),
        );

        final result = await remoteDataSource.getPhotos();

        expect(result, equals(tPhotos));
        verify(() => client.get(Uri.https(kBaseUrl, kGetPhotosEndpoint,
            {...kGetPhotosParams, 'page': '1'}))).called(1);
        verifyNoMoreInteractions(client);
      },
    );
    test(
      'should throw [APIException] when the status code is not 200',
      () async {
        const tMessage = 'Server error';
        when(() => client.get(any())).thenAnswer(
          (_) async => http.Response(
            tMessage,
            500,
          ),
        );

        final methodCall = remoteDataSource.getPhotos;

        expect(
          () => methodCall(),
          throwsA(
            const APIException(message: tMessage, statusCode: 500),
          ),
        );

        verify(() => client.get(Uri.https(kBaseUrl, kGetPhotosEndpoint,
            {...kGetPhotosParams, 'page': '1'}))).called(1);
        verifyNoMoreInteractions(client);
      },
    );
  });
}
