import 'exception.dart';

class ServerException extends AppException {
  final String errorMessage;
  ServerException({required this.errorMessage});
}
