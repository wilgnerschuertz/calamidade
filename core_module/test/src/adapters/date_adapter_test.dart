import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('date adapter ...', () {
    final format = DateAdapter.dateAndHour(DateTime(2024, 04, 02, 10, 30, 20));

    expect(format, '02/04 às 10h');
  });
}
