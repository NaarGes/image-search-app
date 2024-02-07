class Endpoints {
  static const String baseUrl = 'https://flickr.com/services/rest';
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const Duration sendTimeout = Duration(milliseconds: 15000);

  static const String searchPhoto = 'flickr.photos.search';
}
