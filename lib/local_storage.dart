import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// D:\flutter_test\app_pre_exam\lib\local_storage.dart

class LoginLocalStoragePage extends StatefulWidget {
  const LoginLocalStoragePage({super.key});

  @override
  State<LoginLocalStoragePage> createState() => _LoginLocalStoragePageState();
}

class _LoginLocalStoragePageState extends State<LoginLocalStoragePage> {
  final TextEditingController _usernameController = TextEditingController();

  // Save username to SharedPreferences
  Future<void> _saveUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    // Navigate to Home page after saving
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomePageLocalStorage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUsername,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageLocalStorage extends StatefulWidget {
  const HomePageLocalStorage({super.key});

  @override
  State<HomePageLocalStorage> createState() => _HomePageLocalStorageState();
}

class _HomePageLocalStorageState extends State<HomePageLocalStorage> {
  String _username = '';

  // Load username from SharedPreferences
  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
    });
  }

  // Clear username and go back to Login page
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Welcome, $_username', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}