import 'package:core_module/core_module.dart';
import '/app/(public)/auth/register/register_page.dart' as a0;
import '/app/(public)/auth/login/login_page.dart' as a1;
import 'app/(public)/ask_help/new_ask_help/new_ask_help_page.dart' as a2;
import 'app/(public)/ask_help/ask_help_page.dart' as a3;
import 'app/(public)/splash/splash_page.dart' as a4;
import 'app/(public)/home/home_page.dart' as a5;

List<RouteEntity> get routes => [
      RouteEntity(
        key: '/auth/register',
        uri: Uri.parse('/auth/register'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a0.RegisterPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/login',
        uri: Uri.parse('/auth/login'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a1.LoginPage(),
        ),
      ),
      RouteEntity(
        key: '/ask_help/new_ask_help',
        uri: Uri.parse('/ask_help/new_ask_help'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a2.NewAskHelpPage(),
        ),
      ),
      RouteEntity(
        key: '/ask_help',
        uri: Uri.parse('/ask_help'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a3.AskHelpPage(),
        ),
      ),
      RouteEntity(
        key: '/splash',
        uri: Uri.parse('/splash'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a4.SplashPage(),
        ),
      ),
      RouteEntity(
        key: '/home',
        uri: Uri.parse('/home'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a5.HomePage(),
        ),
      ),
    ];

const routePaths = (
  path: '/',
  auth: (
    path: '/auth',
    register: '/auth/register',
    login: '/auth/login',
  ),
  askHelp: (
    path: '/ask_help',
    newAskHelp: '/ask_help/new_ask_help',
  ),
  splash: '/splash',
  home: '/home',
);
