import 'package:coopartilhar/app/features/auth/data/adapters/user_adapter.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/credentials_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/session_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/entities/user_entity.dart';
import 'package:coopartilhar/app/features/auth/interactor/repositories/i_auth_repository.dart';
import 'package:coopartilhar/app/features/auth/interactor/states/auth_state.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

const _kUserKey = 'user';
const _kTokenKey = 'token';
const _kRefreshTokenKey = 'refreshToken';
const _kTokenExpiresKey = 'tokenExpires';

class LoginControllerImpl extends BaseController<BaseState> {
  LoginControllerImpl({
    required this.cache,
    required this.repository,
  }) : super(AuthInitial());

  final IAuthRepository repository;
  final ICache cache;

  late final passwordController = TextEditingController();
  late final emailController = TextEditingController();
  late final formKey = GlobalKey<FormState>();

  Future<void> checkSession() async {
    update(AuthLoading());

    final user = await getUser();
    if (user == null) {
      return update(AuthInitial());
    }

    update(AuthSuccess(data: user));
  }

  Future<void> login() async {
    update(AuthLoading());

    final email = emailController.text;
    final password = passwordController.text;

    final result = await repository.login(
      credentials: CredentialsEntity(email: email, password: password),
    );

    result.fold(
      (error) => update(AuthError(exception: error)),
      (success) => tokenStorage(success),
    );
  }

  Future<UserEntity?> getUser() async {
    final userMap = await cache.getData(_kUserKey);
    if (userMap == null) return null;

    return UserAdapter.fromJson(userMap);
  }

  void tokenStorage(SessionEntity session) {
    final token = session.token;
    final refreshToken = session.refreshToken;
    final tokenExpires = session.tokenExpires;
    final user = session.user;

    cache.setData(
      params: CacheParams(key: _kTokenKey, value: token),
    );
    cache.setData(
      params: CacheParams(key: _kRefreshTokenKey, value: refreshToken),
    );
    cache.setData(
      params: CacheParams(key: _kTokenExpiresKey, value: tokenExpires),
    );
    cache.setData(
      params: CacheParams(key: _kUserKey, value: UserAdapter.toJson(user)),
    );

    // TODO: Back-end não retorna os campos de nome e photo
    update(AuthSuccess(data: session.user));
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
