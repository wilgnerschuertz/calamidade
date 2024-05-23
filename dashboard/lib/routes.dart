import 'package:core_module/core_module.dart';

import 'package:dashboard/app/(public)/auth/login/login_page.dart' as a0;
import 'package:dashboard/app/(public)/home/approved_requests/approved_requests_page.dart'
    as a1;
import 'package:dashboard/app/(public)/home/dashboard/dashboard_page.dart'
    as a2;
import 'package:dashboard/app/(public)/home/denied_requests/denied_requests_page.dart'
    as a3;
import 'package:dashboard/app/(public)/home/home_layout.dart' as a4;
import 'package:dashboard/app/(public)/home/new_requests/new_requests_page.dart'
    as a5;
import 'package:dashboard/app/(public)/home/user/user_page.dart' as a6;

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
        key: '/home/approved_requests',
        parent: '/home',
        uri: Uri.parse('/home/approved_requests'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a1.ApprovedRequestsPage(),
        ),
      ),
      // TODO: (bracinho2): dashboard comentado;
      // RouteEntity(
      //   key: '/home/dashboard',
      //   parent: '/home',
      //   uri: Uri.parse('/home/dashboard'),
      //   routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      //     ctx,
      //     settings,
      //     const a2.DashboardPage(),
      //   ),
      // ),
      RouteEntity(
        key: '/home/denied_requests',
        parent: '/home',
        uri: Uri.parse('/home/denied_requests'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a3.DeniedRequestsPage(),
        ),
      ),
      RouteEntity(
        key: '/home',
        uri: Uri.parse('/home'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a4.HomeLayout(),
        ),
      ),
      RouteEntity(
        key: '/home/new_requests',
        parent: '/home',
        uri: Uri.parse('/home/new_requests'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a5.NewRequestsPage(),
        ),
      ),
      RouteEntity(
        key: '/home/user',
        parent: '/home',
        uri: Uri.parse('/home/user'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a6.UserPage(),
        ),
      ),
    ];

const routePaths = (
  path: '/',
  auth: (
    path: '/auth',
    login: '/auth/login',
  ),
  home: (
    path: '/home',
    approvedRequests: '/home/approved_requests',
    dashboard: '/home/dashboard',
    deniedRequests: '/home/denied_requests',
    newRequests: '/home/new_requests',
    user: '/home/user',
  ),
);
