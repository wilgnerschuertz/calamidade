import 'package:coopartilhar/app/features/home/data/home_repository_impl.dart';
import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:core_module/core_module.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add(HomeInteractor.new);
    injector.add<IHomeRepository>(HomeRepositoryImpl.new);
  },
);
