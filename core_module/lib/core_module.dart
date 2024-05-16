library core_module;

import 'core_module.dart';

import 'src/cache/shared_preferences_impl.dart';

export 'package:auto_injector/auto_injector.dart';
export 'package:either_dart/either.dart';
export 'package:routefly/routefly.dart';
export 'package:uicons/uicons.dart';

export 'src/cache/cache.dart';
export 'src/entities/entity.dart';
export 'src/errors/errors.dart';
export 'src/states/base_state.dart';
export 'src/types/types.dart';
export 'src/client/client.dart';
export 'src/controllers/controllers.dart';
export 'src/helpers/validators_helper.dart';

final coreModule = AutoInjector(
  on: (injector) {
    injector.addSingleton<ICache>(SharedPreferencesImpl.new);
  },
);
