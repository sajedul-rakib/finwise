import 'package:hive_ce_flutter/hive_ce_flutter.dart';

abstract class LocalPinDatasource {
  Future<bool> validatePin(String pin);
  Future<bool> setPin(String pin);
  Future<bool> clearPin();
}

class LocalPinDatasourceImpl implements LocalPinDatasource {
  final Box _box;

  LocalPinDatasourceImpl(Box box) : _box = box;

  @override
  Future<bool> clearPin() {
    _box.delete('pin');
    final boxPin = _box.get('pin', defaultValue: '');
    return Future.value(boxPin.isEmpty);
  }

  @override
  Future<bool> setPin(String pin) async {
    final findPreviousPin = _box.get('pin', defaultValue: '');
    if (findPreviousPin.isNotEmpty && findPreviousPin == pin) {
      throw Exception(
        'Your current pin and previous pin are same.Please try again with different pin.',
      );
    }
    _box.put('pin', pin);
    final hasPinPass = _box.get('pin', defaultValue: '');

    return Future.value(hasPinPass.isNotEmpty);
  }

  @override
  Future<bool> validatePin(String pin) {
    final boxPin = _box.get('pin', defaultValue: '');
    if (boxPin.isEmpty) return Future.value(false);
    return Future.value(boxPin == pin);
  }
}
