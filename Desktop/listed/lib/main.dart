import 'package:flutter/material.dart';

void main() {
  runApp(const ListedApp());
}

class ListedApp extends StatelessWidget {
  const ListedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listed Staging',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepPurple,
          secondary: Colors.purpleAccent,
        ),
      ),
      home: const LoginPreviewPage(),
    );
  }
}

class LoginPreviewPage extends StatefulWidget {
  const LoginPreviewPage({super.key});

  @override
  State<LoginPreviewPage> createState() => _LoginPreviewPageState();
}

class _LoginPreviewPageState extends State<LoginPreviewPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  void _login() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    await Future.delayed(const Duration(seconds: 2)); // simulate API call

    setState(() {
      _isLoading = false;
      if (_emailController.text == "test@listed.com" &&
          _passwordController.text == "123456") {
        _message = "✅ Login successful!";
      } else {
        _message = "❌ Invalid credentials";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "🧪 Listed Staging Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: _login,
                      icon: const Icon(Icons.login),
                      label: const Text("Login"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
              const SizedBox(height: 24),
              if (_message != null)
                Text(
                  _message!,
                  style: const TextStyle(fontSize: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
