import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/repositories/i_new_request_repository.dart';
import 'package:dashboard/app/features/home/new_requests/data/new_request_repository_impl.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/controllers/new_requests_controller.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add<INewRequestRepository>(NewRequestRepositoryImpl.new);
    injector.add<NewRequestsController>(NewRequestsController.new);
    injector.commit();
  },
);
