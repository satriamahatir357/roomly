import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}