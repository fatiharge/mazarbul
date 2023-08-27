library mazarbul;

import 'package:shared_preferences/shared_preferences.dart';
import 'src/exceptions/shared_init_exception.dart';

class Mazarbul {
  // A private instance for the singleton pattern.
  static final Mazarbul _instance = Mazarbul._internal();

  // Private constructor, not intended for direct use.
  Mazarbul._internal();

  // Standard factory constructor that returns the singleton instance.
  factory Mazarbul() => _instance;

  // Constructor to create a Mazarbul instance with initialized SharedPreferences.
  factory Mazarbul.withSharedPreferences(SharedPreferences sp) {
    _instance._sp = sp;
    return _instance;
  }

  // Method to initialize SharedPreferences.
  Future<void> initSp(Enum enm) async {
    _enum ??= enm;
    _sp ??= await SharedPreferences.getInstance();
  }

  SharedPreferences? _sp;
  Enum? _enum;

  SharedPreferences? get sp => _sp;

  // Getter to return the singleton Mazarbul instance.
  static Mazarbul get instance {
    if (_instance._sp == null) {
      throw SharedInitException();
    }
    return _instance;
  }

  // Method to save a String value with a key.
  void saveString(Enum key, String value) {
    instance._sp!.setString(key.name, value);
  }

  // Method to save a Boolean value with a key.
  Future<void> saveBool(Enum key, bool value) async {
    await instance._sp!.setBool(key.name, value);
  }

  // Method to save a list of String items with a key.
  Future<void> saveStringItems(Enum key, List<String> value) async {
    await instance._sp!.setStringList(key.name, value);
  }

  // Method to get a list of String items associated with a key.
  List<String>? getStrings(Enum key) {
    return instance._sp!.getStringList(key.name);
  }

  // Method to get a String value associated with a key.
  String? getString(Enum key) {
    return instance._sp!.getString(key.name);
  }

  // Method to get a Boolean value associated with a key.
  bool? getBool(Enum key) {
    return _sp!.getBool(key.name);
  }

  // Method to remove a value associated with a key.
  Future<bool> removeItem(Enum key) async {
    return await _sp!.remove(key.name);
  }
}