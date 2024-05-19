import 'dart:io';

import 'package:coopartilhar/app/features/accident/data/repositories/i_accident_repository.dart';
import 'package:coopartilhar/app/features/accident/entities/accident_entity.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_help_type_entity.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_status_entity.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/state/file_state.dart';
import 'package:coopartilhar/app/features/file/data/repositories/i_file_repository.dart';
import 'package:coopartilhar/app/features/file/entities/pressigned_entity.dart';
import 'package:core_module/core_module.dart';

import 'package:coopartilhar/app/features/ask_help/data/repositories/i_new_ask_help_repository.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:flutter/material.dart';

class AskHelpController extends BaseController {
  AskHelpController(
      {required INewAskHelpRepository repository,
      required IFileRepository fileRepository,
      required IFilePickerService filePickerService,
      required IAccidentRepository accidentRepository})
      : _repository = repository,
        _fileRepository = fileRepository,
        _filePickerService = filePickerService,
        _accidentRepository = accidentRepository,
        super(InitialState());

  final IAccidentRepository _accidentRepository;
  final IFileRepository _fileRepository;
  final INewAskHelpRepository _repository;
  final IFilePickerService _filePickerService;

  // TODO: Implementar remote config
  double preApprovedValue = 3500.00;

  List<String> files = [];

  late final formKey = GlobalKey<FormState>();
  late final TextEditingController titleController =
      TextEditingController(text: 'test');
  late final TextEditingController cpfController =
      TextEditingController(text: '12345678910');
  late final TextEditingController pixKeyController =
      TextEditingController(text: 'test');
  late final TextEditingController bankController =
      TextEditingController(text: 'test');
  late final TextEditingController agencyController =
      TextEditingController(text: 'test');
  late final TextEditingController accountController =
      TextEditingController(text: 'test');
  late final TextEditingController valueController =
      TextEditingController(text: '1000');
  late final TextEditingController descriptionController =
      TextEditingController(text: 'test');

  Future<void> pickFile() async {
    update(FileLoadingState());
    final filesPath = await _filePickerService.pickFiles(
      allowedExtensions: ['png', 'jpg'],
    );
    if (filesPath != null) {
      files = filesPath;
      update(FileLoadedState(files));
    } else {
      update(FileErrorState());
    }
    // TODO: Capturar arquivos
    // TODO: Listar arquivo selecionado caso for imagem
  }

  void _generateAccident(PressignedEntity pressignedEntity,
      SolicitationEntity solicitationEntity) async {
    final AccidentEntity accidentEntity = AccidentEntity(
        solicitationId: solicitationEntity.id!,
        fileId: pressignedEntity.fileId);
    final response = await _accidentRepository.saveAccident(accidentEntity);

    response.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (success) => update(const SuccessState(data: true)),
    );
  }

  void _generateSolicitation(
    PressignedEntity pressignedEntity,
  ) async {
    final SolicitationEntity solicitation = SolicitationEntity(
      title: titleController.text,
      cpf: cpfController.text,
      value: CurrencyAdapter.removeMask(valueController.text),
      status: SolicitationStatusEntity(id: 1, name: 'Financial'),
      helpType: SolicitationHelpTypeEntity(
        id: 1,
        name: 'Analysis',
      ),
    );
    final response = await _repository.saveSolicitation(solicitation);

    response.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (success) => _generateAccident(pressignedEntity, solicitation),
    );
  }

  void _uploadFile(String fileName, PressignedEntity pressignedEntity,
      List<int>? fileBytes) async {
    final responseUpload = await _fileRepository.upload(
      fileName: fileName,
      presignedUrl: pressignedEntity,
      fileBytes: fileBytes,
    );
    responseUpload.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (_) => _generateSolicitation(pressignedEntity),
    );
  }

  Future<void> submiSolicitation() async {
    if (formKey.currentState!.validate()) {
      if(files.length <= 0){
        update(FileErrorState());
        return;
      }
      update(LoadingState());

      final File file = File(files.first);
      final String fileName = file.path.split('/').last;

      final responsePresigned =
          await _fileRepository.getPresignedUrl(fileName: fileName);

      responsePresigned.fold(
        (error) => update(ErrorState<BaseException>(exception: error)),
        (success) => _uploadFile(fileName, success, file.readAsBytesSync()),
      );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    cpfController.dispose();
    pixKeyController.dispose();
    bankController.dispose();
    agencyController.dispose();
    accountController.dispose();
    valueController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  String? valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Valor não pode esta vazio';
    }
    if (CurrencyAdapter.removeMask(value!) > preApprovedValue) {
      return 'Valor não pode ser maior que o limite pré-aprovado.';
    }
    return null;
  }
}
