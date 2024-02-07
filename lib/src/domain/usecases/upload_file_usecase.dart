import 'package:flutter/foundation.dart';
import 'package:flutter_advance/src/data/repositories/auth_repository.dart';
import 'package:flutter_advance/src/domain/usecases/usecase.dart';

class UploadFileUsecase implements UseCase<String?, UploadFileParams> {
  final AuthRepository repository;

  UploadFileUsecase(this.repository);

  @override
  Future<String?> call(params) async {
    return await repository.uploadFile(
      fileByte: params.fileByte,
      fileName: params.fileName,
    );
  }
}

class UploadFileParams {
  final String fileName;
  final Uint8List fileByte;

  UploadFileParams({required this.fileName, required this.fileByte});
}
