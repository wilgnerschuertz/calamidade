import 'package:dashboard/app/features/home/new_requests/interactor/entities/new_request_entity.dart';
import 'package:flutter/material.dart';

class NewRequestsController with ChangeNotifier {
  NewRequestEntity? lastItem;
  String selectedId = '';

  final requestsList = List.generate(
    22,
    (index) => NewRequestEntity(
      index.toString(),
      titleDescription: 'Reconstrução Telhado $index',
      name: 'João Maria da Silva $index',
      city: 'Estância Velha',
      phone: '+55 (51) 9 1234-5648',
      date: '15 de maio às 10h',
      status: index.isEven ? StatusNewRequest.low : StatusNewRequest.high,
      requestedIncome: '3.500,00',
      bank: 'CooperBank',
      agency: 'Estância Velha',
      account: '+55 (51) 9 1234-5648',
      urlImage: 'url',
      description: 'Telhado',
    ),
  );

  void selectItem(String id) {
    selectedId = id;
    notifyListeners();
  }

  void removeLastItemIfOddList(List<NewRequestEntity> list) {
    if (list.length.isOdd) {
      lastItem = list.removeLast();
      notifyListeners();
    }
  }

  final statusColor = {
    StatusNewRequest.low: const Color.fromARGB(255, 0, 255, 34),
    StatusNewRequest.medium: const Color.fromARGB(255, 0, 38, 255),
    StatusNewRequest.high: const Color.fromARGB(255, 255, 0, 0),
  };
}
