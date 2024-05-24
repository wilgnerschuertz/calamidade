import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/auth/data/login_repository_impl.dart';
import 'package:dashboard/app/features/auth/interactor/controllers/login_controller.dart';
import 'package:dashboard/app/features/auth/interactor/repositories/login_repository.dart';

import 'package:dashboard/app/features/home/request/interactor/repositories/i_request_repository.dart';
import 'package:dashboard/app/features/home/request/data/request_repository_impl.dart';
import 'package:dashboard/app/features/home/request/interactor/controller/request_controller.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add<LoginRepository>(LoginRepositoryImpl.new);
    injector.addSingleton<LoginController>(LoginController.new);

    injector.add<IRequestRepository>(RequestRepositoryImpl.new);
    injector.addSingleton<RequestController>(RequestController.new);
    injector.commit();
  },
);
