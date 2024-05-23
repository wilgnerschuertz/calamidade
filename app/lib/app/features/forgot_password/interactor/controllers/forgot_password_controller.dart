import 'package:coopartilhar/app/features/address/interactor/states/address_states.dart';
import 'package:coopartilhar/app/features/forgot_password/interactor/entities/forgot_password_entity.dart';
import 'package:coopartilhar/app/features/forgot_password/interactor/repositories/i_forgot_password_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordController extends BaseController {
  final IForgotPasswordRepository _repository;

  late final pinputController = TextEditingController();
  late final formKey = GlobalKey<FormState>();

  ForgotPasswordController(this._repository) : super(InitialState());

  Future<void> sendEmailPass(ForgotPasswordEntity forgotEntity) async {
    update(AddressLoadingState());

    final response = await _repository.sendEmailPass(forgotEntity: forgotEntity);

    response.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (data) => update(SuccessState(data: data)),
    );
  }
}
