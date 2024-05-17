import 'package:coopartilhar/app/features/register/interactor/controllers/register_controller.dart';
import 'package:coopartilhar/app/features/register/data/repositories/i_register_repository.dart';
import 'package:coopartilhar/app/features/register/data/repositories/register_assisted_repository_impl.dart';
import 'package:core_module/core_module.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.addSingleton<IRegisterRepository>(RegisterRepositoryImpl.new);
    injector.addSingleton<RegisterController>(RegisterController.new);
    injector.commit();
  },
);
