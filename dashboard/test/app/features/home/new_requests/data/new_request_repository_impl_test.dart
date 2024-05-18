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
            data: _response,
            statusCode: 200,
          ),
        );

        final result = await requestRepository.getNewRequest();

        expect(result.isRight, true);
        expect(result.right, isA<List<NewRequestEntity>>());
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

const _response = '''{
  "data":[
  {
    "id": "1",
    "name": "Alice",
    "status": "alta",
    "city": "São Paulo",
    "phone": "1234567890",
    "bank": "Banco do Brasil",
    "agency": "1234",
    "account": "56789-0",
    "urlImage": "https://example.com/image1.jpg",
    "description": "Pedido de aprovação para projeto A."
  },
  {
    "id": "2",
    "name": "Bruno",
    "status": "media",
    "city": "Rio de Janeiro",
    "phone": "0987654321",
    "bank": "Caixa Econômica",
    "agency": "4321",
    "account": "98765-1",
    "urlImage": "https://example.com/image2.jpg",
    "description": "Pedido de avaliação para financiamento."
  },
  {
    "id": "3",
    "name": "Carla",
    "status": "baixa",
    "city": "Belo Horizonte",
    "phone": "1122334455",
    "bank": "Bradesco",
    "agency": "1111",
    "account": "22222-2",
    "urlImage": "https://example.com/image3.jpg",
    "description": "Solicitação de crédito pessoal."
  },
  {
    "id": "4",
    "name": "Daniel",
    "status": "alta",
    "city": "Porto Alegre",
    "phone": "2233445566",
    "bank": "Santander",
    "agency": "2222",
    "account": "33333-3",
    "urlImage": "https://example.com/image4.jpg",
    "description": "Pedido de aprovação para novo empreendimento."
  }
]}''';
