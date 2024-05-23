import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/data/login_repository_impl.dart';
import 'package:dashboard/app/features/auth/interactor/controllers/login_controller.dart';
import 'package:dashboard/app/features/auth/interactor/controllers/onboarding_controller.dart';
import 'package:dashboard/app/features/auth/data/onboarding_repository_impl.dart';
import 'package:dashboard/app/features/auth/interactor/interface/i_onboarding_repository.dart';
import 'package:dashboard/app/features/auth/interactor/repositories/login_repository.dart';

import 'package:dashboard/app/features/home/request/interactor/repositories/request_repository.dart';
import 'package:dashboard/app/features/home/request/data/request_repository.dart';
import 'package:dashboard/app/features/home/request/interactor/controller/request_controller.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add<LoginRepository>(LoginRepositoryImpl.new);
    injector.addSingleton<LoginController>(LoginController.new);
    injector.add<IOnboardingRepository>(OnboardingRepositoryImpl.new);
    injector.addSingleton(OnboardingController.new);
    injector.add<RequestRepository>(RequestRepositoryImpl.new);
    injector.add<RequestController>(RequestController.new);
    injector.commit();
  },
);
