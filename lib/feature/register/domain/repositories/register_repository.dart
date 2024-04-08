import 'package:dartz/dartz.dart';
import 'package:tenderyard/core/api_client/api_response.dart';
import 'package:tenderyard/feature/register/data/models/user_data_model.dart';
import '../../../../core/error/exception.dart';

abstract class RegisterRepository {
  Future<Either<AppException, ApiResponse>> registerAsIndividual(
      UserDataModel userDataModel);
  Future<Either<AppException, ApiResponse>> registerAsIndividualOwner(
      UserDataModel userDataModel);
  Future<Either<AppException, ApiResponse>> registerAsJuridicalPerson(
      UserDataModel userDataModel);
}
