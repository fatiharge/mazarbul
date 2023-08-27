/// A library for managing SharedPreferences using the singleton pattern.
library mazarbul;

import 'package:shared_preferences/shared_preferences.dart';
import 'src/exceptions/shared_init_exception.dart';

/// The main class for interacting with SharedPreferences.
class Mazarbul {
  /// A private instance for implementing the singleton pattern.
  static final Mazarbul _instance = Mazarbul._internal();

  /// Private constructor, not intended for direct use.
  Mazarbul._internal();

  /// Standard factory constructor that returns the singleton instance.
  factory Mazarbul() => _instance;

  /// Constructor to create a Mazarbul instance with initialized SharedPreferences.
  ///
  /// [sp] Initialized SharedPreferences instance.
  factory Mazarbul.withSharedPreferences(SharedPreferences sp) {
    _instance._sp = sp;
    return _instance;
  }

  SharedPreferences? _sp;

  SharedPreferences? get sp => _sp;

  /// Initializes the SharedPreferences instance if not already initialized.
  Future<void> initSp() async {
    _sp ??= await SharedPreferences.getInstance();
  }

  /// Returns the singleton Mazarbul instance.
  ///
  /// Throws [SharedInitException] if SharedPreferences is not initialized.
  static Mazarbul get instance {
    if (_instance._sp == null) {
      throw SharedInitException();
    }
    return _instance;
  }

  /// Saves a String value with a specified key.
  ///
  /// [key] The enum key for the value.
  /// [value] The value to be saved.
  void saveString(Enum key, String value) {
    instance._sp!.setString(key.name, value);
  }

  /// Saves a Boolean value with a specified key.
  ///
  /// [key] The enum key for the value.
  /// [value] The value to be saved.
  Future<void> saveBool(Enum key, bool value) async {
    await instance._sp!.setBool(key.name, value);
  }

  /// Saves a list of String items with a specified key.
  ///
  /// [key] The enum key for the value.
  /// [value] The list of values to be saved.
  Future<void> saveStringItems(Enum key, List<String> value) async {
    await instance._sp!.setStringList(key.name, value);
  }

  /// Retrieves a list of String items associated with a specified key.
  ///
  /// [key] The enum key for the value.
  List<String>? getStrings(Enum key) {
    return instance._sp!.getStringList(key.name);
  }

  /// Retrieves a String value associated with a specified key.
  ///
  /// [key] The enum key for the value.
  String? getString(Enum key) {
    return instance._sp!.getString(key.name);
  }

  /// Retrieves a Boolean value associated with a specified key.
  ///
  /// [key] The enum key for the value.
  bool? getBool(Enum key) {
    return _sp!.getBool(key.name);
  }

  /// Removes a value associated with a specified key.
  ///
  /// [key] The enum key for the value.
  Future<bool> removeItem(Enum key) async {
    return await _sp!.remove(key.name);
  }
}
