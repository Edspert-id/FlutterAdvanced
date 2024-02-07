import 'package:flutter_advance/src/data/repositories/auth_repository.dart';
import 'package:flutter_advance/src/domain/entities/registration_model.dart';
import 'package:flutter_advance/src/domain/usecases/usecase.dart';


class RegistrationUsecase implements UseCase<bool, RegistrationModel> {
  final AuthRepository repository;

  RegistrationUsecase(this.repository);

  @override
  Future<bool> call(params) async {
    return await repository.registrationUser(params);
  }
}
