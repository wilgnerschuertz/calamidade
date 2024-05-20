import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/login/data/login_repository_impl.dart';
import 'package:dashboard/app/features/auth/login/data/onboarding_repository_impl.dart';
import 'package:dashboard/app/features/auth/login/interactor/controllers/login_controller.dart';
import 'package:dashboard/app/features/auth/login/interactor/controllers/onboarding_controller.dart';
import 'package:dashboard/app/features/auth/login/interactor/interface/i_login_repository.dart';
import 'package:dashboard/app/features/auth/login/interactor/interface/i_onboarding_repository.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/repositories/i_new_request_repository.dart';
import 'package:dashboard/app/features/home/new_requests/data/new_request_repository_impl.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/controllers/new_requests_controller.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);

    injector.add<ILoginRepository>(LoginRepositoryImpl.new);
    injector.addSingleton(LoginController.new);
    injector.add<IOnboardingRepository>(OnboardingRepositoryImpl.new);
    injector.addSingleton(OnboardingController.new);

    injector.add<INewRequestRepository>(NewRequestRepositoryImpl.new);
    injector.add<NewRequestsController>(NewRequestsController.new);
    injector.commit();
  },
);
