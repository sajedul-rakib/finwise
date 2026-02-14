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
    //delete pin from local storage
    _box.delete('pin');
    // set false for checking has security in the device
    _box.put("hasPin", false);
    final boxPin = _box.get('pin', defaultValue: '');
    return Future.value(boxPin.isEmpty);
  }

  //this function work for set for a new pin, and change pin
  @override
  Future<bool> setPin(String pin) async {
    bool hasPin = _box.get("hasPin", defaultValue: false);

    if (hasPin) {
      final findPreviousPin = _box.get('pin', defaultValue: '');
      if (findPreviousPin == pin) {
        throw Exception(
          'Your current pin and previous pin are same.Please try again with different pin.',
        );
      }
    }
    _box.put('pin', pin);
    _box.put("hasPin", true);
    final hasPinPass = _box.get('pin', defaultValue: '');
    return Future.value(hasPinPass.isNotEmpty);
  }

  @override
  Future<bool> validatePin(String pin) {
    final boxPin = _box.get('pin', defaultValue: '');
    return Future.value(boxPin == pin);
  }
}
