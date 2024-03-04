import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage/src/storage_entry.dart';
import 'package:remote_repository/remote_repository.dart';

class LocalStorage {
  /// box that stores all evidence status
  static final StorageEntry<DummyModel> _dummyBox
  = StorageEntry<DummyModel>();

  /// map of all storage boxes, accessible by a StorageKey
  static final Map<StorageKey, StorageEntry> _storages = {
    StorageKey.dummy : _dummyBox,
  };

  /// gets a list of T values by searching inside the map
  static List<T>? getValues<T>(StorageKey key)
  => _storages[key]?.values as List<T>?;

  static Future<void> setBox<T>(StorageKey key, List<T> values) async {
    await _storages[key]?.remoteAll();
    await _storages[key]?.addAll(values);
  }

  /// deletes an item by its id from a box
  static Future<void> deleteFromBox(StorageKey key, String? id) async
  => _storages[key]?.remove(id);

  /// adds a list of T items to a storage box
  static Future<void> addAllToBox<T>(StorageKey key, List<T> values) async
  => _storages[key]?.addAll(values);

  /// adds a T items to a storage box
  static Future<void> addToBox<T>(StorageKey key, T value, {String? id}) async
  => _storages[key]?.add(value, key: id);

  static Future<void> deleteFromBoxAt(StorageKey key, int index) async
  => _storages[key]?.remoteAt(index);

  static Stream<T?> getStream<T>(StorageKey key)
    => _storages[key]!.box!.watch().map((event) => event.value);

  /// loads all local databases as hive boxes
  static Future<void> loadBoxes() async {
    await Hive.initFlutter();

    // registers all adapters to hive
    Hive
      ..registerAdapter(DummyModelAdapter());

    final boxes = await Future.wait([
      Hive.openBox<DummyModel>(StorageKey.dummy.value),
    ]);

    _dummyBox.setBox(boxes[0]);
  }
}

enum StorageKey {
  dummy('DUMMY');

  final String value;
  const StorageKey(this.value);
}