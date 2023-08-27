# Mazarbul Package

![Version](https://img.shields.io/badge/version-1.0.9-blue.svg?cacheSeconds=2592000)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Mazarbul is a Dart package that provides a simple interface to work with SharedPreferences. It offers methods to save and retrieve various data types with associated keys.


## Usage

```dart
import 'package:mazarbul/mazarbul.dart';

// Initialize Mazarbul
await Mazarbul().initSp();

// Save a String value
Mazarbul().saveString(Enum.someKey, 'Hello, Mazarbul!');

// Retrieve a String value
String? retrievedString = Mazarbul().getString(Enum.someKey);

// Save a Boolean value
await Mazarbul().saveBool(Enum.someBoolKey, true);

// Retrieve a Boolean value
bool? retrievedBool = Mazarbul().getBool(Enum.someBoolKey);

// ... other methods for different data types ...
```

## API Reference

For detailed information about the available methods, check out the [API Reference](https://your-api-reference-url.com).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## What is Mazarbul?

Mazarbul is a term from J.R.R. Tolkien's legendarium, specifically from the world of Middle-earth. In the fictional universe, Mazarbul refers to a book of records kept by dwarves in Khazad-dûm (also known as Moria). Just like the book in Middle-earth, this package aims to help you record and retrieve data easily using SharedPreferences.

![Mazarbul](https://raw.githubusercontent.com/fatiharge/mazarbul/main/assets/img.png)


## Fatiharge

Bu proje [Fatih Ar-Ge](https://www.fatiharge.com) tarafından geliştirilmiştir. Dart projelerinde SharedPreferences kullanımını basitleştirmeyi amaçlayan bir basit projedir. "Mazarbul" paket adı, Orta Dünya'nın zengin mitolojisinden ilham alarak seçilmiş olup, J.R.R. Tolkien'in büyük eserine saygıdır.

This project is proudly developed by [Fatih Ar-Ge](https://www.fatiharge.com) to simplify working with SharedPreferences in Flutter projects. The package name "Mazarbul" is inspired by the rich lore of Middle-earth, paying homage to the great work of J.R.R. Tolkien.