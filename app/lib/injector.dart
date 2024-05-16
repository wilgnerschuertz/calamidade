import 'package:coopartilhar/app/features/register/interactor/controllers/register_controller.dart';
import 'package:core_module/core_module.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
    injector.addSingleton<BaseController>(RegisterController.new);
  },
);
