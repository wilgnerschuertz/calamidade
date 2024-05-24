import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/interceptor/auth_interceptor.dart';
import 'package:dashboard/routes.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      builder: InterceptorConfig.instance,
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: '/auth/login',
      ),
    );
  }
}
