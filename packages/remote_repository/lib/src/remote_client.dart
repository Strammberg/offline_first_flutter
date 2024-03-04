import 'package:dio/dio.dart';
import 'package:remote_repository/src/models/dummy_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'remote_client.g.dart';

@RestApi()
abstract class RemoteClient {
  factory RemoteClient(Dio dio, {String baseUrl}) = _RemoteClient;

  @GET('/dummy')
  Future<HttpResponse<List<DummyModel>>> getDummyDate();
}