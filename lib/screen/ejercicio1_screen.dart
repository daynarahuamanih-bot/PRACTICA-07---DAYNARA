import 'package:flutter/material.dart';
import '../controllers/ejercicio1_controller.dart';

class Ejercicio1Screen extends StatefulWidget {
  const Ejercicio1Screen({super.key});

  @override
  State<Ejercicio1Screen> createState() => _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {
  // Instancia del controlador de lógica
  final Ejercicio1Controller _controller = Ejercicio1Controller();

  // Controladores de texto para los campos de entrada
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();

  String _resultado = '';
  Color _colorEstado = Colors.black;

  @override
  void dispose() {
    _nombreController.dispose();
    _nota1Controller.dispose();
    _nota2Controller.dispose();
    _nota3Controller.dispose();
    super.dispose();
  }

  void _ejecutarCalculo() {
    String res = _controller.calcular(
      nombre: _nombreController.text,
      nota1Str: _nota1Controller.text,
      nota2Str: _nota2Controller.text,
      nota3Str: _nota3Controller.text,
    );

    setState(() {
      _resultado = res;
      if (res.startsWith('Advertencia')) {
        _colorEstado = Colors.orange.shade800;
      } else if (res.startsWith('Error')) {
        _colorEstado = Colors.red;
      } else {
        _colorEstado = res.contains('Aprobado')
            ? Colors.green.shade700
            : Colors.red.shade700;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1: Promedio Académico'),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del estudiante',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 1 (0 - 20)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 2 (0 - 20)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 3 (0 - 20)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ejecutarCalculo,
              child: const Text('Calcular promedio'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _colorEstado,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}