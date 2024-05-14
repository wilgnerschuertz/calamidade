library core_module;

import 'core_module.dart';

export 'package:auto_injector/auto_injector.dart';
export 'package:either_dart/either.dart';
export 'package:routefly/routefly.dart';
export 'package:uicons/uicons.dart';

export 'src/entities/entity.dart';
export 'src/errors/errors.dart';
export 'src/states/base_state.dart';
export 'src/types/types.dart';

export 'src/cache/cache.dart';

final coreModule = AutoInjector(
  on: (injector) {},
);
