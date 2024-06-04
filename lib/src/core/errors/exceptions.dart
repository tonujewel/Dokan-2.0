import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  const ApiException({required this.message, required this.code});

  final String message;
  final int code;

  @override
  List<Object?> get props => [message, code];
}
