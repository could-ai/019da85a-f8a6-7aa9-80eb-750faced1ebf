import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CreativeAssistantApp());
}

class CreativeAssistantApp extends StatelessWidget {
  const CreativeAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF673AB7),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Georgia', // Un toque literario y clásico
      ),
      home: const HomeScreen(),
    );
  }
}
