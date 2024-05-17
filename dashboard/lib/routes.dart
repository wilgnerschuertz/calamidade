import 'package:routefly/routefly.dart';

import 'app/(public)/auth/login/login_page.dart' as a0;
import 'app/(public)/home/home_page.dart' as a1;

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
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.HomePage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  auth: (
    path: '/auth',
    login: '/auth/login',
  ),
  home: '/home',
);
