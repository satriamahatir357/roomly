import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const RoomlyApp());
}

class RoomlyApp extends StatelessWidget {
  const RoomlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roomly',
      home: const LoginScreen(),
    );
  }
}