import 'package:get_it/get_it.dart';
import 'package:tenderyard/feature/register/data/datasources/register_data_source.dart';
import 'package:tenderyard/feature/register/data/repositories/register_repository_impl.dart';
import 'package:tenderyard/feature/register/domain/repositories/register_repository.dart';
import 'package:tenderyard/feature/register/domain/usecases/register_as_individual.dart';
import 'package:tenderyard/feature/register/domain/usecases/register_as_individual_owner.dart';
import 'package:tenderyard/feature/register/domain/usecases/register_as_juridical_person.dart';
import 'package:tenderyard/feature/register/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Register
  sl.registerLazySingleton(
    () => RegisterBloc(
      registerAsIndividual: sl(),
      registerAsIndividualOwner: sl(),
      registerAsJuridicalPerson: sl(),
    ),
  );
  // * Usecase
  sl.registerLazySingleton(
    () => RegisterAsIndividual(
      registerRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => RegisterAsIndividualOwner(
      registerRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => RegisterAsJuridicalPerson(
      registerRepository: sl(),
    ),
  );
  // * Repository
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      registerDataSource: sl(),
    ),
  );
  // * Data sources
  sl.registerLazySingleton<RegisterDataSource>(
    () => RegisterDataSourceImpl(),
  );
}
