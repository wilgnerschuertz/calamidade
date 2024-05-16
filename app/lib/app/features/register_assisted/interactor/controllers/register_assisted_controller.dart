import 'package:coopartilhar/app/features/register_assisted/entities/assisted_entity.dart';
import 'package:coopartilhar/app/features/register_assisted/repositories/i_register_assisted_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/widgets.dart';

class RegisterAssistedController extends BaseController {
  final IRegisterAssistedRepository repository;

  RegisterAssistedController({required this.repository})
      : super(InitialState());

  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final documentTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final latitude = ValueNotifier<double>(0);
  final longitude = ValueNotifier<double>(0);

  Future<void> register() async {
    update(LoadingState());

    final assisted = AssistedEntity(
      '',
      email: emailTextController.text,
      name: nameTextController.text,
      document: documentTextController.text,
      phone: phoneTextController.text,
      latitude: latitude.value,
      longitude: longitude.value,
    );

    final response = await repository.register(assisted: assisted);

    response.fold(
      (l) => update(ErrorState(exception: l)),
      (r) => update(SuccessState<AssistedEntity>(data: r)),
    );
  }

  String? emailValidator(String? text) =>
      ValidatorsHelper.emailIsValid(text) ? null : 'E-mail inválido';

  String? nameValidator(String? text) =>
      nameTextController.text.isNotEmpty ? null : 'Nome inválido';

  String? documentValidator(String? text) =>
      ValidatorsHelper.documentIsValid(text) ? null : 'Documento inválido';

  String? phoneValidator(String? text) =>
      ValidatorsHelper.phoneIsValid(text) ? null : 'Telefone inválido';
}
