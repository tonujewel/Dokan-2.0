import 'dart:convert';
import 'dart:developer';

import 'package:dokan/src/core/networking/api_url.dart';
import 'package:dokan/src/core/networking/dio_client.dart';
import 'package:dokan/src/features/profile/data/models/user_model.dart';
import 'package:dokan/src/features/profile/domain/entities/update_profile_req.dart';
import 'package:dokan/src/features/register/data/models/success_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class ProfileDataSrc {
  Future<UserModel> getProfileData();
  Future<UserModel> updateProfile(UpdateProfileReq body);
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
      throw ApiException(message: e.toString(), code: 505);
    }
  }

  @override
  Future<UserModel> updateProfile(UpdateProfileReq body) async {
    try {
      final result = await client.post(url: UrlManager.updateProfileUrl, body: body.toJson());

      // SuccessModel res = const SuccessModel(code: 200, msg: "Profile updated");
      UserModel res = UserModel.fromJson(json.decode(result));

      return res;
    } on ApiException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      throw ApiException(message: e.toString(), code: 505);
    }
  }
}
