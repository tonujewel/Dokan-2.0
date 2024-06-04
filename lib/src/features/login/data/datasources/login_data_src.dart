import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api_url.dart';
import '../../../../core/networking/dio_client.dart';
import '../models/login_model.dart';

abstract class LoginDataSrc {
  Future<LoginModel> loginRequest(Map<String, dynamic> params);
}

class LoginDataSrcImpl implements LoginDataSrc {
  final DioClient client;

  LoginDataSrcImpl({required this.client});

  @override
  Future<LoginModel> loginRequest(Map<String, dynamic> params) async {
    try {
      final result = await client.post(url: UrlManager.loginUrl, params: params);

      LoginModel res = LoginModel.fromJson(json.decode(result));

      return res;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), code: 505);
    }
  }
}
