import 'package:hive_flutter/hive_flutter.dart';

class StorageEntry<T> {
  Box<T>? box;

  void setBox(Box<T> box) => this.box = box;

  List<T>? get values => box?.values.toList();

  Future<void> add(T value, {String? key}) async {
    if(key != null) {
      box?.put(key, value);
    } else {
      box?.add(value);
    }
  }

  Future<void> addAll(List<T> values) async => box?.addAll(values);

  Future<void> remove(String? id) async => await box?.delete(id);

  Future<void> remoteAt(int index) async => await box?.deleteAt(index);

  Future<void> remoteAll() async => await box?.clear();
}