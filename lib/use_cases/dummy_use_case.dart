import 'package:local_storage/local_storage.dart';
import 'package:remote_repository/remote_repository.dart';

class GetDummyUseCase {
  final RemoteRepository remoteRepository;
  GetDummyUseCase({required this.remoteRepository});

  Future<void> getDummyData() async {
    final result = await remoteRepository.getDummyData();
    result.when(
        success: (d) async
          => await LocalStorage.setBox(StorageKey.dummy, d.data),
        failure: (e) => throw e,
    );
  }
}