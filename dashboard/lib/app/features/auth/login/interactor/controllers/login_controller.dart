import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/login/interactor/entities/credentials_entity.dart';
import 'package:dashboard/app/features/auth/login/interactor/interface/i_login_repository.dart';
import 'package:flutter/widgets.dart';

class LoginController extends BaseController<BaseState> {
  final ILoginRepository repository;
  LoginController({
    required this.repository,
  }) : super(InitialState());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future auth() async {
    if (formKey.currentState!.validate()) {
      update(LoadingState());

      final credentials = CredentialsEntity(
        const Uuid().v4(),
        emailController.text,
        passwordController.text,
      );

      final response = await repository.auth(credentials);
      response.fold(
        (l) => update(ErrorState(exception: l)),
        (r) => update(SuccessState(data: r)),
      );
    }
  }
}
