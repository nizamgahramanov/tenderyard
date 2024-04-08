import 'package:dartz/dartz.dart';
import '../error/exception.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppException, Type>> call(Params params);
}

class NoParams {}
