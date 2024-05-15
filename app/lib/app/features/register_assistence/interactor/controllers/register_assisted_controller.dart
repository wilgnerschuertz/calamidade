import 'package:coopartilhar/app/features/register_assistence/entities/assisted_entity.dart';
import 'package:coopartilhar/app/features/register_assistence/repositories/i_register_assisted_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/cupertino.dart';

class RegisterAssistedController extends BaseController {
  final IRegisterAssistedRepository repository;

  RegisterAssistedController({required this.repository})
      : super(InitialState());

  final email = TextEditingController();
  final name = TextEditingController();
  final document = TextEditingController();
  final phone = TextEditingController();
  final latitude = ValueNotifier<double>(0);
  final longitude = ValueNotifier<double>(0);

  Future<void> register() async {
    update(LoadingState());

    final assisted = AssistedEntity(
      '',
      email.text,
      name.text,
      document.text,
      phone.text,
      latitude.value,
      longitude.value,
    );

    final response = await repository.register(assisted: assisted);

    response.fold(
      (l) => update(ErrorState(exception: l)),
      (r) => update(SuccessState<AssistedEntity>(data: r)),
    );
  }

  String? emailValidator(String? text) {
    return email.text.isNotEmpty ? null : 'E-mail inválido';
  }

  String? nameValidator(String? text) {
    return name.text.isNotEmpty ? null : 'Nome inválido';
  }

  String? documentValidator(String? text) {
    return document.text.isNotEmpty ? null : 'Documento inválido';
  }

  String? phoneValidator(String? text) {
    return phone.text.isNotEmpty ? null : 'Telefone inválido';
  }
}
