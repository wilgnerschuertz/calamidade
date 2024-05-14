import 'package:app/app/(public)/ask_help/ask_help_page.dart' as a0;
import 'package:app/app/(public)/ask_help/new_ask_help/new_ask_help_page.dart' as a1;
import 'package:app/app/(public)/auth/login/login_page.dart' as a2;
import 'package:app/app/(public)/auth/register/register_page.dart' as a3;
import 'package:app/app/(public)/home/home_page.dart' as a4;
import 'package:app/app/(public)/splash/splash_page.dart' as a5;
import 'package:core_module/core_module.dart';

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/ask_help',
    uri: Uri.parse('/ask_help'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.AskHelpPage(),
    ),
  ),
  RouteEntity(
    key: '/ask_help/new_ask_help',
    uri: Uri.parse('/ask_help/new_ask_help'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.NewAskHelpPage(),
    ),
  ),
  RouteEntity(
    key: '/auth/login',
    uri: Uri.parse('/auth/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/auth/register',
    uri: Uri.parse('/auth/register'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.RegisterPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.SplashPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  askHelp: (
    path: '/ask_help',
    newAskHelp: '/ask_help/new_ask_help',
  ),
  auth: (
    path: '/auth',
    login: '/auth/login',
    register: '/auth/register',
  ),
  home: '/home',
  splash: '/splash',
);
