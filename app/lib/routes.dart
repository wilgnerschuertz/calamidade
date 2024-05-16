import 'package:routefly/routefly.dart';

import 'app/(public)/affiliated_first_action/presentation/affiliated_first_action_page.dart'
    as a12;
import 'app/(public)/ask_help/ask_help_page.dart' as a11;
import 'app/(public)/ask_help/new_ask_help/new_ask_help_page.dart' as a10;
import 'app/(public)/auth/affiliated/affiliated_page.dart' as a3;
import 'app/(public)/auth/check_affiliated/check_affiliated_page.dart' as a6;
import 'app/(public)/auth/login/login_page.dart' as a7;
import 'app/(public)/auth/not_affiliated/not_affiliated_page.dart' as a4;
import 'app/(public)/auth/register/register_page.dart' as a5;
import 'app/(public)/home/home_page.dart' as a0;
import 'app/(public)/onboarding/onboarding_page.dart' as a14;
import 'app/(public)/register_assistence/register_assistence_page.dart' as a13;
import 'app/(public)/splash/splash_page.dart' as a2;
import 'app/(public)/success_state/success_state_page.dart' as a1;
import 'app/(public)/want_to_help/want_to_help_page.dart' as a8;
import 'app/(public)/welcome/welcome_page.dart' as a9;

List<RouteEntity> get routes => [
      RouteEntity(
        key: '/home',
        uri: Uri.parse('/home'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a0.HomePage(),
        ),
      ),
      RouteEntity(
        key: '/success_state',
        uri: Uri.parse('/success_state'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a1.SuccessStatePage(),
        ),
      ),
      RouteEntity(
        key: '/splash',
        uri: Uri.parse('/splash'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a2.SplashPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/affiliated',
        uri: Uri.parse('/auth/affiliated'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a3.AffiliatedPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/not_affiliated',
        uri: Uri.parse('/auth/not_affiliated'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a4.NotAfilliatedPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/register',
        uri: Uri.parse('/auth/register'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          a5.RegisterPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/check_affiliated',
        uri: Uri.parse('/auth/check_affiliated'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a6.CheckAffiliatedPage(),
        ),
      ),
      RouteEntity(
        key: '/auth/login',
        uri: Uri.parse('/auth/login'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a7.LoginPage(),
        ),
      ),
      RouteEntity(
        key: '/want_to_help',
        uri: Uri.parse('/want_to_help'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a8.WantToHelpPage(),
        ),
      ),
      RouteEntity(
        key: '/ask_help/new_ask_help',
        uri: Uri.parse('/ask_help/new_ask_help'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a10.NewAskHelpPage(),
        ),
      ),
      RouteEntity(
        key: '/ask_help',
        uri: Uri.parse('/ask_help'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a11.AskHelpPage(),
        ),
      ),
      RouteEntity(
        key: '/affiliated_first_action/presentation/affiliated_first_action',
        uri: Uri.parse(
            '/affiliated_first_action/presentation/affiliated_first_action'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a12.AffiliatedFirstActionPage(),
        ),
      ),
      RouteEntity(
        key: '/register_assistence',
        uri: Uri.parse('/register_assistence'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a13.RegisterAssistencePage(),
        ),
      ),
      RouteEntity(
        key: '/onboarding',
        uri: Uri.parse('/onboarding'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a14.OnboardingPage(),
        ),
      ),
    ];

const routePaths = (
  path: '/',
  home: '/home',
  successState: '/success_state',
  splash: '/splash',
  auth: (
    path: '/auth',
    affiliated: '/auth/affiliated',
    notAffiliated: '/auth/not_affiliated',
    register: '/auth/register',
    checkAffiliated: '/auth/check_affiliated',
    login: '/auth/login',
  ),
  wantToHelp: '/want_to_help',
  welcome: '/welcome',
  askHelp: (
    path: '/ask_help',
    newAskHelp: '/ask_help/new_ask_help',
  ),
  affiliatedFirstAction: (
    path: '/affiliated_first_action',
    presentation: (
      path: '/affiliated_first_action/presentation',
      affiliatedFirstAction:
          '/affiliated_first_action/presentation/affiliated_first_action',
    ),
  ),
  registerAssistence: '/register_assistence',
  onboarding: '/onboarding',
);
