import 'package:flutter/material.dart';
import 'screen/ejercicio1_screen.dart';
import 'screen/ejercicio2_screen.dart';
import 'screen/ejercicio3_screen.dart';
import 'screen/ejercicio4_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Ejercicio4Screen(),
    );
  }
}