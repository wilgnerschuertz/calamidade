import 'package:coopartilhar/app/features/bank_account/entities/bank_account.dart';
import 'package:core_module/core_module.dart';

class BankAccountLoadingState extends BaseState {}

class BankAccountLoadedState implements BaseState {
  final List<BankAccountEntity> bankAccounts;
  final BankAccountEntity? selectedBankAccount;

  BankAccountLoadedState(this.bankAccounts, {this.selectedBankAccount});
}
