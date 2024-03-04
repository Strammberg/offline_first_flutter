import 'package:dio/dio.dart';
import 'package:remote_repository/remote_repository.dart';
import 'package:remote_repository/src/remote_client.dart';
import 'package:retrofit/dio.dart';

class RemoteRepository {
  final String baseUrl;
  final Dio dio;

  RemoteRepository({required this.baseUrl, required this.dio});

  Future<ApiResult<HttpResponse<List<DummyModel>>>> getDummyData() async
    => await _executeCall<List<DummyModel>>(_client.getDummyDate());

  Future<ApiResult<HttpResponse<T>>> _executeCall<T>(Future apiCall) async {
    try {
      final response = await apiCall;
      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkException.getDioException(e));
    }
  }

  RemoteClient get _client => RemoteClient(dio, baseUrl: baseUrl);
}