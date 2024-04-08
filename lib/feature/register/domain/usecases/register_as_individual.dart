import 'package:dartz/dartz.dart';
import 'package:tenderyard/core/api_client/api_response.dart';
import 'package:tenderyard/feature/register/data/models/user_data_model.dart';
import 'package:tenderyard/feature/register/domain/repositories/register_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/usecases/usecase.dart';

class RegisterAsIndividual extends UseCase<ApiResponse, Params> {
  final RegisterRepository registerRepository;
  RegisterAsIndividual({required this.registerRepository});
  Future<Either<AppException, ApiResponse>> call(Params params) async {
    return await registerRepository.registerAsIndividual(params.userDataModel);
  }
}

class Params {
  final UserDataModel userDataModel;

  Params({required this.userDataModel});
}
