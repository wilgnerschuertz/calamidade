import 'package:coopartilhar/app/features/auth/interactor/entities/credentials_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/session_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/user_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/repositories/i_auth_repository.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class LoginControllerImpl<AuthState> extends BaseController {
  LoginControllerImpl({
    required this.cache,
    required this.repository,
  }) : super(InitialState());

  final IAuthRepository repository;
  final ICache cache;

  late final passwordController = TextEditingController();
  late final emailController = TextEditingController();
  late final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    update(LoadingState());

    final email = emailController.value.toString();
    final password = passwordController.value.toString();

    final result = await repository.login(credentials: CredentialsEntity(email: email, password: password));

    result.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (success) => tokenStorage(success),
    );
  }

  void tokenStorage(SessionEntity session) {
    final token = session.token;
    final refreshToken = session.refreshToken;
    final tokenExpires = session.tokenExpires;
    final user = session.user;

    cache.setData(params: CacheParams(key: 'token', value: token));
    cache.setData(params: CacheParams(key: 'refreshToken', value: refreshToken));
    cache.setData(params: CacheParams(key: 'tokenExpires', value: tokenExpires));
    cache.setData(params: CacheParams(key: 'user', value: user));

    // TODO: Back-end não retorna os campos de nome e photo
    update(SuccessState<UserEntity>(data: session.user));
  }

  String? Function(String?)? validatorEmpty(String message) {
    return (value) {
      if (value == null || value.isEmpty) {
        return message;
      }
      return null;
    };
  }
}
