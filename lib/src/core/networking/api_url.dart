class UrlManager {
  // Base url
  static const _baseUrl = "https://apptest.dokandemo.com/wp-json";

  static String loginUrl = "$_baseUrl/jwt-auth/v1/token";

  static String signUpURL = "$_baseUrl/wp/v2/users/register";

  static const String userInformationURL = "${_baseUrl}wp-json/wp/v2/users/me";

  // // Product list
  // static String searchUrl({required int perPage, required int page}) =>
  //     "$_baseUrl/search/repositories?q=Flutter+language:dart&per_page=$perPage&sort=stars&page=$page";
}
