import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:offline_first/common/screen_status.dart';
import 'package:offline_first/features/dummy/dummy_state.dart';
import 'package:offline_first/use_cases/dummy_use_case.dart';
import 'package:remote_repository/remote_repository.dart';

class DummyCubit extends Cubit<DummyState> {
  // remote repository to enter api calls
  final RemoteRepository remoteRepository;

  // subscription for the dummy model stream
  StreamSubscription<DummyModel?>? _subscription;

  DummyCubit({required this.remoteRepository}): super(DummyState()) {
    init();
    getDummy();
  }

  /// gets stream of dummyModels
  Stream<DummyModel?> get _dummy
    => LocalStorage.getStream<DummyModel>(StorageKey.dummy);

  void init() {
    // load values from local db initially
    final values = LocalStorage.getValues<DummyModel>(StorageKey.dummy);
    if(values != null) {
      emit(state.copyWith(dummies: values));
    }

    // subscribes to all dummyModel events, each time a new dummyModel is added
    // changed or removed from the local db, hive sends an event that we
    // subscribe to, here we check if there is actually an item sent and whether
    // the item is already set inside list
    _subscription = _dummy.listen((item) {
      if(item == null) return;
      if(state.dummies.any((i) => i.id == item.id)) return;

      emit(state.copyWith(dummies: [...state.dummies, item]));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  // gets all dummy models from the api via use case
  Future<void> getDummy() async {
    try {
      emit(state.copyWith(status: const ScreenStatus.loading()));
      final useCase = GetDummyUseCase(remoteRepository: remoteRepository);
      await useCase.getDummyData();
      emit(state.copyWith(status: const ScreenStatus.success()));
    } catch(e) {
      emit(state.copyWith(status: ScreenStatus.error(messageKey: '$e')));
    }
  }
}