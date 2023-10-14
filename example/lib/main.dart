import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mazarbul/mazarbul.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Mazarbul start
  await Mazarbul().initSp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

enum KeyType { userName, isLoggedIn }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _customDataController = TextEditingController();
  String _userName = "";
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  /// Fetches saved data from Mazarbul and updates the state.
  Future<void> _fetchData() async {
    _userName = Mazarbul.instance.getString(KeyType.userName) ?? "";
    if (kDebugMode) {
      print(_userName);
    }
    _isLoggedIn = Mazarbul.instance.getBool(KeyType.isLoggedIn) ?? false;
    if (kDebugMode) {
      print(_isLoggedIn);
    }

    setState(() {});
  }

  /// Saves user-entered data to Mazarbul and updates the state.
  Future<void> _saveData() async {
    _userName = _customDataController.value.text;
    _isLoggedIn = _customDataController.value.text != "";
    Mazarbul.instance.saveString(KeyType.userName, _userName);
    if (kDebugMode) {
      print(_userName);
    }
    Mazarbul.instance.saveBool(KeyType.isLoggedIn, _isLoggedIn);
    if (kDebugMode) {
      print(_isLoggedIn);
    }
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mazarbul Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome, $_userName",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              "Is Logged In: $_isLoggedIn",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _customDataController,
              decoration: const InputDecoration(labelText: "Custom Data"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text("Save Data"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
