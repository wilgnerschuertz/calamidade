import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/data/i_new_request_repository.dart';
import 'package:dashboard/app/features/home/new_requests/data/new_request_repository_impl.dart';
import 'package:dashboard/app/features/home/new_requests/entities/new_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';

class RestClientMock extends Mock implements IRestClient {}

void main() {
  late final IRestClient restClientMock;
  late final INewRequestRepository requestRepository;

  setUpAll(() {
    restClientMock = RestClientMock();
    requestRepository = NewRequestRepositoryImpl(restClient: restClientMock);
    registerFallbackValue(RestClientRequest(path: 'path'));
  });

  group('NewRequestRepository |', () {
    test(
      'Must bring a JSON from the Api and convert it to a NewRequestEntity',
      () async {
        when(
          () => restClientMock.get(any()),
        ).thenAnswer(
          (_) async => RestClientResponse(
            request: RestClientRequest(path: ''),
            data: '{"teste": "testandooo"}',
            statusCode: 200,
          ),
        );

        final result = await requestRepository.getNewRequest();

        expect(result.isRight, true);
        expect(result.right, isA<NewRequestEntity>());
      },
    );

    test('Must return a Error when connect to Api', () async {
      when(
        () => restClientMock.get(any()),
      ).thenThrow(
        const DefaultException(message: 'Requisição inválida'),
      );

      final result = await requestRepository.getNewRequest();

      expect(result.isLeft, true);
      expect(result.left, isA<DefaultException>());
    });
  });
}
