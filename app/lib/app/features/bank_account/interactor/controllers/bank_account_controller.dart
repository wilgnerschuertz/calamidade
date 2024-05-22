import 'package:coopartilhar/app/features/bank_account/entities/bank_account.dart';
import 'package:coopartilhar/app/features/bank_account/interactor/repositories/i_bank_account_repository.dart';
import 'package:coopartilhar/app/features/bank_account/interactor/states/bank_states.dart';
import 'package:core_module/core_module.dart';

class BankAccountController extends BaseController {
  final IBankAccountRepository repository;

  BankAccountController(this.repository) : super(InitialState());

  Future<void> getAll(BankAccountEntity? bankAccount) async {
    update(BankAccountLoadingState());
    final response = await repository.getAll();
    response.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (data) => update(
          BankAccountLoadedState(data, selectedBankAccount: bankAccount)),
    );
  }

  void changeBankAccount(bankAccount) {
    final currentState = state;
    if (currentState is BankAccountLoadedState) {
      update(BankAccountLoadedState(
        currentState.bankAccounts,
        selectedBankAccount: bankAccount,
      ));
    }
  }
}
