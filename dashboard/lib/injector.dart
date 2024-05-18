import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/data/i_new_request_repository.dart';
import 'package:dashboard/app/features/home/new_requests/data/new_request_repository_impl.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add<INewRequestRepository>(NewRequestRepositoryImpl.new);
  },
);
