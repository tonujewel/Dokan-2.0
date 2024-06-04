import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api_url.dart';
import '../../../../core/networking/dio_client.dart';
import '../models/success_model.dart';
import 'register_req.dart';

abstract class RegisterDataSrc {
  Future<SuccessModel> doRegister(RegisterReq body);
}

class RegisterDataSrcImpl implements RegisterDataSrc {
  final DioClient client;

  RegisterDataSrcImpl({required this.client});
  @override
  Future<SuccessModel> doRegister(RegisterReq body) async {
    try {
      final result = await client.post(url: UrlManager.loginUrl, body: body.toJson());

      SuccessModel res = SuccessModel.fromJson(jsonDecode(result));

      return res;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
