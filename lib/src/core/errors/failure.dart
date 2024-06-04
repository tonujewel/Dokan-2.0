import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final int code;

  const Failure({required this.message, required this.code});

  @override
  List<Object?> get props => [message, code];
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message, required super.code});

  ApiFailure.fromException(ApiException exception) : this(code: exception.code, message: exception.message);
}
