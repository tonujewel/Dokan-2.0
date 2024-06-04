import 'package:dokan/src/features/register/domain/entities/success_entity.dart';

class SuccessModel extends SuccessEntity {
  const SuccessModel({required super.code, required super.msg});

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(code: json["code"], msg: json["message"]);
}
