import 'package:core_module/core_module.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.addInjector(coreModule);
  },
);
