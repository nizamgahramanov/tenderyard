import 'package:dartz/dartz.dart';
import 'package:tenderyard/core/api_client/api_response.dart';
import 'package:tenderyard/feature/register/domain/usecases/register_as_individual.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/register_repository.dart';

class RegisterAsIndividualOwner extends UseCase<ApiResponse, Params> {
  final RegisterRepository registerRepository;
  RegisterAsIndividualOwner({required this.registerRepository});
  Future<Either<AppException, ApiResponse>> call(Params params) async {
    return await registerRepository
        .registerAsIndividualOwner(params.userDataModel);
  }
}
