import 'package:routefly/routefly.dart';

import 'app/(public)/auth/login_page.dart' as a0;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/auth/login',
    uri: Uri.parse('/auth/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.LoginPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  auth: (
    path: '/auth',
    login: '/auth/login',
  ),
);
