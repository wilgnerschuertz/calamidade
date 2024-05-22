import 'package:coopartilhar/app/features/bank_account/entities/bank_account.dart';
import 'package:core_module/core_module.dart';

abstract class IBankAccountRepository {
  Future<Output<List<BankAccountEntity>>> getAll();
  Future<Output<void>> save(BankAccountEntity address);
}
