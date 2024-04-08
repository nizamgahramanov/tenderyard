import 'package:dartz/dartz.dart';
import 'package:tenderyard/core/api_client/api_response.dart';
import 'package:tenderyard/feature/register/data/datasources/register_data_source.dart';
import 'package:tenderyard/feature/register/data/models/user_data_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/server_exception.dart';
import '../../domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource registerDataSource;

  RegisterRepositoryImpl({required this.registerDataSource});

  @override
  Future<Either<AppException, ApiResponse>> registerAsIndividual(
      UserDataModel userDataModel) async {
    try {
      final result =
          await registerDataSource.registerAsIndividual(userDataModel);
      return Right(result);
    } on ServerException {
      return Left(ServerException(errorMessage: ""));
    }
  }

    @override
  Future<Either<AppException, ApiResponse>> registerAsIndividualOwner(
      UserDataModel userDataModel) async {
    try {
      final result =
          await registerDataSource.registerAsIndividualOwner(userDataModel);
      return Right(result);
    } on ServerException {
      return Left(ServerException(errorMessage: ""));
    }
  }

    @override
  Future<Either<AppException, ApiResponse>> registerAsJuridicalPerson(
      UserDataModel userDataModel) async {
    try {
      final result =
          await registerDataSource.registerAsJuridicalPerson(userDataModel);
      return Right(result);
    } on ServerException {
      return Left(ServerException(errorMessage: ""));
    }
  }
}
