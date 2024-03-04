import 'package:dio/dio.dart';

///
/// auth client that provides the different authenticated http methods
///
class DioClient {
  static DioClient? _instance;

  late Dio client;

  static DioClient get instance => _instance!;

  static DioClient init(String baseUrl) {
    if (_instance != null) return _instance!;
    _instance = DioClient();
    _instance!._initInstance(
      baseUrl,
    );
    return _instance!;
  }

  /// initializes the auth client
  Future<void> _initInstance(String baseUrl) async {
    client = Dio(
      BaseOptions(
        receiveTimeout: Duration(seconds: 30),
        connectTimeout: Duration(seconds: 30),
        baseUrl: baseUrl,
      ),
    );
  }
}
