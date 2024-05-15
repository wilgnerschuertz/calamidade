import 'package:core_module/core_module.dart';
import 'package:core_module/src/client/dio/rest_client_dio_impl.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements DioForNative {}

void main() {
  late MockDio mockDio;
  late IRestClient restClient;

  setUp(
    () {
      mockDio = MockDio();
      restClient = RestClientDioImpl(dio: mockDio);
    },
  );

  group('Rest Client impl', () {
    test('get', () async {
      when(
        () => mockDio.get(
          '',
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async => Response(
            data: 'test',
            requestOptions: RequestOptions(
              path: '',
            ),
            statusCode: 200,
          ));

      final result = await restClient.get(
        RestClientRequest(path: ''),
      );
      expect(result.statusCode, 200);
    });
  });
}
