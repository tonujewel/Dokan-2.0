import 'dart:convert';

import 'package:dokan/src/core/networking/api_url.dart';
import 'package:dokan/src/core/networking/dio_client.dart';
import 'package:dokan/src/features/profile/data/models/user_model.dart';
import 'package:dokan/src/features/profile/domain/entities/update_profile_req.dart';
import 'package:dokan/src/features/register/data/models/success_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class ProfileDataSrc {
  Future<UserModel> getProfileData();
  Future<SuccessModel> updateProfile(UpdateProfileReq body);
}

class ProfileDataSrcImpl implements ProfileDataSrc {
  final DioClient client;

  ProfileDataSrcImpl({required this.client});
  @override
  Future<UserModel> getProfileData() async {
    try {
      final result = await client.post(url: UrlManager.profileInfoURL);

      UserModel res = UserModel.fromJson(json.decode(result));

      return res;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<SuccessModel> updateProfile(UpdateProfileReq body) async {
    try {
      final result = await client.post(url: UrlManager.updateProfileUrl);

      SuccessModel res = SuccessModel.fromJson(json.decode(result));

      return res;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
