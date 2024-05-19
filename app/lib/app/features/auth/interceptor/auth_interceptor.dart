import 'dart:async';

import 'package:coopartilhar/app/features/auth/data/adapters/session_adapter.dart';
import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class InterceptorConfig extends StatefulWidget {
  final Widget? child;

  const InterceptorConfig({super.key, this.child});

  static InterceptorConfig instance(BuildContext context, Widget? child) {
    return InterceptorConfig(child: child);
  }

  @override
  State<InterceptorConfig> createState() => _InterceptorConfigState();
}

class _InterceptorConfigState extends State<InterceptorConfig> {
  final client = injector.get<IRestClient>();

  @override
  void initState() {
    super.initState();
    client.addInterceptors(AuthInterceptor());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? Container();
  }
}

class AuthInterceptor implements IClientInterceptor {
  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async {
    final token = await injector.get<LoginControllerImpl>().getToken();
    if (token.isNotEmpty) {
      request.headers?['Authorization'] = 'Bearer $token';
    }
    return request;
  }

  @override
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response) {
    return response;
  }

  @override
  FutureOr<RestClientHttpMessage> onError(RestClientException error) async {
    if (error.statusCode == 401) {
      final client = injector.get<IRestClient>();
      final loginController = injector.get<LoginControllerImpl>();
      final refreshToken = await loginController.getRefreshToken();

      try {
        final result = await client.post(RestClientRequest(
          path: '/core/v1/auth/refresh',
          headers: {
            'Authorization': 'Bearer $refreshToken',
          },
        ));
        final session = SessionAdapter.fromJson(result.data);
        await loginController.tokenStorage(session);

        final request = error.response!.request;
        request.headers?['Authorization'] = 'Bearer ${session.token}';
        if (request.method.toLowerCase() == 'get') {
          return client.get(request);
        } else if (request.method.toLowerCase() == 'post') {
          return client.post(request);
        } else if (request.method.toLowerCase() == 'put') {
          return client.put(request);
        } else if (request.method.toLowerCase() == 'delete') {
          return client.delete(request);
        } else if (request.method.toLowerCase() == 'patch') {
          return client.patch(request);
        }
      } catch (e) {
        Routefly.navigate(routePaths.auth.login);
        return error;
      }
    }
    return error;
  }
}
