import 'package:flutter/material.dart';
import 'services/time_service.dart';

void main() {
  runApp(const SupportersApp());
}

class SupportersApp extends StatelessWidget {
  const SupportersApp({super.key});

  @override
  Widget build(BuildContext context) {
    final now = getCurrentFormattedTime();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Supporters Time Check')),
        body: Center(
          child: Text(
            '앱 실행 시각:\n$now',
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
