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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Listed Staging Environment 🚀'),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: const Center(
        child: Text(
          'This is the STAGING version of Listed.\nEverything works perfectly!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
