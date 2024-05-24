library core_module;

import 'package:core_module/src/file_picker/file_picker_impl.dart';
import 'package:dio/dio.dart';

import 'core_module.dart';
import 'src/cache/shared_preferences_impl.dart';
import 'src/client/dio/rest_client_dio_impl.dart';

export 'package:auto_injector/auto_injector.dart';
export 'package:either_dart/either.dart';
export 'package:mocktail/mocktail.dart';
export 'package:routefly/routefly.dart';
export 'package:uuid/uuid.dart';

export 'src/adapters/auth/user_adapter.dart';
export 'src/adapters/cpf_cnpj_adapter.dart';
export 'src/adapters/currency_adapter.dart';
export 'src/adapters/date_adapter.dart';
export 'src/adapters/phone_adapter.dart';
export 'src/cache/cache.dart';
export 'src/client/client.dart';
export 'src/controllers/controllers.dart';
export 'src/entities/auth/user_entity.dart';
export 'src/entities/entity.dart';
export 'src/entities/request/request.dart';
export 'src/errors/errors.dart';
export 'src/file_picker/i_file_picker.dart';
export 'src/helpers/currency_format_helper.dart';
export 'src/helpers/validators_helper.dart';
export 'src/states/base_state.dart';
export 'src/types/types.dart';
export 'src/types/unit.dart';

export 'src/entities/auth/session_entity.dart';
export 'src/adapters/auth/session_adapter.dart';
export 'src/entities/auth/credencial_entity.dart';

export 'src/location/location.dart';
export 'src/location/coordinates.dart';
export 'src/permission_handler/permission_handler.dart';
export 'src/helpers/zip_format_helper.dart';
export 'src/adapters/request/request_adapter.dart';

final coreModule = AutoInjector(
  on: (injector) {
    injector.addSingleton<ICache>(SharedPreferencesImpl.new);
    injector.add<Dio>(DioFactory.dio);
    injector.addSingleton<IRestClient>(RestClientDioImpl.new);
    injector.add<IFilePickerService>(FilePickerServiceImpl.new);
  },
);
