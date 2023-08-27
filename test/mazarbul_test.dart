import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mazarbul/mazarbul.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { strtheme }

void main() {
  group('Mazarbul Tests', () {
    SharedPreferences.setMockInitialValues({});
    late SharedPreferences sharedPreferences;
    late Mazarbul sharedManager;

    setUp(() async {
      sharedPreferences = await SharedPreferences.getInstance();
      sharedManager = Mazarbul.withSharedPreferences(sharedPreferences);
    });

    test('Saving and retrieving string value', () async {
      const testKey = SharedKeys.strtheme;
      const testValue = 'dark';

      sharedManager.saveString(testKey, testValue);

      final retrievedValue = sharedManager.getString(testKey);

      if (kDebugMode) {
        print('Test 1: ${retrievedValue == testValue ? "Success" : "Failure"}');
      }

      expect(retrievedValue, equals(testValue));
    });

    test('Saving and retrieving bool value', () async {
      const testKey = SharedKeys.strtheme;
      const testValue = true;

      await sharedManager.saveBool(testKey, testValue);

      final retrievedValue = sharedManager.getBool(testKey);

      if (kDebugMode) {
        print('Test 2: ${retrievedValue == testValue ? "Success" : "Failure"}');
      }

      expect(retrievedValue, equals(testValue));
    });

    test('Saving and retrieving list of strings', () async {
      const testKey = SharedKeys.strtheme;
      final testValue = ['item1', 'item2', 'item3'];

      sharedManager.saveStringItems(testKey, testValue);

      final retrievedValue = sharedManager.getStrings(testKey);

      if (listValuesEqual(retrievedValue, testValue)) {
        if (kDebugMode) {
          print('Test 3: Success');
        }
      } else {
        if (kDebugMode) {
          print('Test 3: Failure');
        }
      }

      expect(retrievedValue, equals(testValue));
    });

    test('Saving and retrieving single string', () async {
      const testKey = SharedKeys.strtheme;
      const testValue = 'dark';

      sharedManager.saveString(testKey, testValue);

      final retrievedValue = sharedManager.getString(testKey);

      if (kDebugMode) {
        print('Test 4: ${retrievedValue == testValue ? "Success" : "Failure"}');
      }

      expect(retrievedValue, equals(testValue));
    });

    test('Retrieving boolean value', () async {
      const testKey = SharedKeys.strtheme;
      const testValue = true;

      await sharedManager.saveBool(testKey, testValue);

      final retrievedValue = sharedManager.getBool(testKey);

      if (kDebugMode) {
        print('Test 5: ${retrievedValue == testValue ? "Success" : "Failure"}');
      }

      expect(retrievedValue, equals(testValue));
    });

    test('Removing item', () async {
      const testKey = SharedKeys.strtheme;
      sharedManager.saveString(testKey, 'value');

      final removed = await sharedManager.removeItem(testKey);
      final retrievedValue = sharedManager.getString(testKey);

      if (kDebugMode) {
        print('Test 6: ${removed == true ? "Success" : "Failure"}');
      }

      expect(removed, equals(true));
      expect(retrievedValue, isNull);
    });
  });
}

bool listValuesEqual(List<String>? list1, List<String>? list2) {
  if (list1 == null || list2 == null) {
    return false;
  }

  if (list1.length != list2.length) {
    return false;
  }

  for (var i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }

  return true;
}
