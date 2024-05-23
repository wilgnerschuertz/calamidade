import 'dart:io';

import 'package:coopartilhar/app/features/accident/data/repositories/i_accident_repository.dart';
import 'package:coopartilhar/app/features/accident/entities/accident_entity.dart';
import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_help_type_entity.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_status_entity.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/repositories/i_new_ask_help_repository.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/state/file_state.dart';
import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/app/features/auth/interactor/states/auth_state.dart';
import 'package:coopartilhar/app/features/bank_account/entities/bank_account.dart';
import 'package:coopartilhar/app/features/file/data/repositories/i_file_repository.dart';
import 'package:coopartilhar/app/features/file/entities/pressigned_entity.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class AskHelpController extends BaseController {
  AskHelpController({
    required INewAskHelpRepository repository,
    required IFileRepository fileRepository,
    required IFilePickerService filePickerService,
    required IAccidentRepository accidentRepository,
    required LoginControllerImpl userController,
  })  : _repository = repository,
        _fileRepository = fileRepository,
        _filePickerService = filePickerService,
        _accidentRepository = accidentRepository,
        _userController = userController,
        super(InitialState());

  final IAccidentRepository _accidentRepository;
  final IFileRepository _fileRepository;
  final INewAskHelpRepository _repository;
  final IFilePickerService _filePickerService;
  final LoginControllerImpl _userController;
  // TODO: Implementar remote config
  double preApprovedValue = 3500.00;

  List<String> files = [];
  AddressEntity? addressEntity;
  BankAccountEntity? bankAccountEntity;
  UserEntity user = UserEntity.init();

  late final formKey = GlobalKey<FormState>();
  late final TextEditingController titleController =
      TextEditingController(text: '');
  late final TextEditingController cpfController =
      TextEditingController(text: '');
  late final TextEditingController valueController =
      TextEditingController(text: '');
  late final TextEditingController descriptionController =
      TextEditingController(text: '');
  late final TextEditingController localizationController =
      TextEditingController(text: '');
  late final TextEditingController accountBankController =
      TextEditingController(text: '');

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
      id: -1,
      account: bankAccountEntity?.account,
      agency: bankAccountEntity?.agency,
      bank: bankAccountEntity?.bankName,
      pix: bankAccountEntity?.keyPix,
      description: descriptionController.text,
      title: titleController.text,
      cpf: cpfController.text,
      value: CurrencyAdapter.removeMask(valueController.text),
      status: SolicitationStatusEntity(id: 1, name: 'Financial'),
      helpType: SolicitationHelpTypeEntity(
        id: 1,
        name: 'Analysis',
      ),
    );

    if (_userController.state case AuthSuccess(:final data)) {
      user = data;
    }

    final response = await _repository.saveSolicitation(
      solicitation,
      user,
    );

    response.fold(
      (error) => update(ErrorState<BaseException>(exception: error)),
      (success) => _generateAccident(pressignedEntity, solicitation),
    );
  }

  void changeAddress(AddressEntity? address) {
    addressEntity = address;
    localizationController.text =
        address != null ? '${address.addressName}' : '';
  }

  void changeBankAccount(BankAccountEntity? bankAccount) {
    if (bankAccount != null) {
      accountBankController.text = bankAccount.bankName != null
          ? bankAccount.bankName!
          : bankAccount.keyPix!;
      bankAccountEntity = bankAccount;
    }
  }

  void _uploadFile(String fileName, PressignedEntity pressignedEntity,
      List<int>? fileBytes) async {
    // final responseUpload = await _fileRepository.upload(
    //   fileName: fileName,
    //   presignedUrl: pressignedEntity,
    //   fileBytes: fileBytes,
    // );

    // responseUpload.fold(
    //   (error) => update(ErrorState<BaseException>(exception: error)),
    //   (_) => _generateSolicitation(pressignedEntity),
    // );
    _generateSolicitation(pressignedEntity);
  }

  Future<void> submiSolicitation() async {
    if (formKey.currentState!.validate()) {
      if (files.isEmpty) {
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
    valueController.dispose();
    descriptionController.dispose();
    localizationController.dispose();
    accountBankController.dispose();
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
