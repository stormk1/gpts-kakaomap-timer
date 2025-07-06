import 'package:flutter/material.dart';
import 'services/time_service.dart';
import 'services/kakao_service.dart';

void main() {
  runApp(const SupportersApp());
}

class SupportersApp extends StatefulWidget {
  const SupportersApp({super.key});

  @override
  State<SupportersApp> createState() => _SupportersAppState();
}

class _SupportersAppState extends State<SupportersApp> {
  String _distanceResult = '계산 중...';

  @override
  void initState() {
    super.initState();
    _calculateDistance();
  }

  Future<void> _calculateDistance() async {
    final kakao = KakaoMapService();
    final distance = await kakao.getDistance("127.1058342,37.359708", "127.1025546,37.358948"); // 예시 좌표
    setState(() {
      _distanceResult = distance != null ? '${distance.toStringAsFixed(2)} km' : '실패';
    });
  }
  // trigger rebuild


  @override
  Widget build(BuildContext context) {
    final now = getCurrentFormattedTime();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Supporters Time & Kakao')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('앱 실행 시각:\n$now',
                  style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Text('카카오 맵 거리 계산 결과:\n$_distanceResult',
                  style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
