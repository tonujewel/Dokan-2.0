import 'package:dokan/src/core/utils/shared_preference_utils.dart';

class UrlManager {
  // Base url
  static const _baseUrl = "https://apptest.dokandemo.com/wp-json";

  static const String loginUrl = "$_baseUrl/jwt-auth/v1/token";

  static const String signUpURL = "$_baseUrl/wp/v2/users/register";

  static const String profileInfoURL = "$_baseUrl/wp/v2/users/me";

  static String updateProfileUrl = "$_baseUrl/wp/v2/users/${SharedPrefUtil.getId()}";
}
