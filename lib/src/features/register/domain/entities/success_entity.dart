import 'package:equatable/equatable.dart';

class SuccessEntity extends Equatable {
  final int code;
  final String msg;

  const SuccessEntity({required this.code, required this.msg});
  @override
  List<Object?> get props => [code, msg];
}
