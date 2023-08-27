/// An exception thrown when trying to access SharedPreferences without proper initialization.
class SharedInitException implements Exception {
  @override
  String toString() {
    return 'Your preferences have not been initialized yet.';
  }
}
