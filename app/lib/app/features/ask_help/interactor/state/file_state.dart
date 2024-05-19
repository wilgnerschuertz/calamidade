import 'package:core_module/core_module.dart';

class FileLoadingState extends BaseState {}

class FileLoadedState implements BaseState {
  final List<String>? paths;
  FileLoadedState(this.paths);
}

class FileErrorState extends BaseState {}
