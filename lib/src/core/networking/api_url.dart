class UrlManager {
  // Base url
  static const _baseUrl = "https://apptest.dokandemo.com/wp-json";

  // Product list
  static String loginUrl = "$_baseUrl/jwt-auth/v1/token";

  // // Product list
  // static String searchUrl({required int perPage, required int page}) =>
  //     "$_baseUrl/search/repositories?q=Flutter+language:dart&per_page=$perPage&sort=stars&page=$page";
}
