import 'package:flutter/material.dart';
import 'package:untitled/qr_scan_screen.dart';

// main
void main() {
  runApp(const MyApp());
}

// MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Qr Code Kullanımı',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}

// Main Page
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            // buton tıklanırsa QrScanScreen sayfasına yönlendirilir
              context, MaterialPageRoute(builder: (context) => const QrScanScreen())),
          // buton text
          child: const Text("Qr Code Tarat"),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red[700]),
          ),
        ),
      ),
    );
  }
}
