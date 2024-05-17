import 'package:coopartilhar/app/features/home/data/home_repository_impl.dart';
import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:coopartilhar/app/features/register/interactor/controllers/register_controller.dart';
import 'package:coopartilhar/app/features/register/repositories/i_register_repository.dart';
import 'package:coopartilhar/app/features/register/repositories/register_assisted_repository_impl.dart';
import 'package:core_module/core_module.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.add(HomeInteractor.new);
    injector.add<IHomeRepository>(HomeRepositoryImpl.new);
    injector.addSingleton<IRegisterRepository>(RegisterRepositoryImpl.new);
    injector.addSingleton<RegisterController>(RegisterController.new);
    injector.commit();
  },
);
