import 'package:flutter/material.dart';
import '../controllers/ejercicio2_controller.dart';

class Ejercicio2Screen extends StatefulWidget {
  const Ejercicio2Screen({super.key});

  @override
  State<Ejercicio2Screen> createState() => _Ejercicio2ScreenState();
}

class _Ejercicio2ScreenState extends State<Ejercicio2Screen> {
  // Instancia del controlador de lógica
  final Ejercicio2Controller _controller = Ejercicio2Controller();

  // Controladores de texto para los campos de entrada
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _horasController = TextEditingController();
  final TextEditingController _pagoHoraController = TextEditingController();

  String _resultado = '';
  Color _colorTexto = Colors.black;

  @override
  void dispose() {
    _nombreController.dispose();
    _horasController.dispose();
    _pagoHoraController.dispose();
    super.dispose();
  }

  void _ejecutarCalculo() {
    String res = _controller.calcularSueldo(
      nombre: _nombreController.text,
      horasTraba: _horasController.text,
      pagoHoraTraba: _pagoHoraController.text,
    );

    setState(() {
      _resultado = res;
      if (res.startsWith('Advertencia')) {
        _colorTexto = Colors.orange.shade800;
      } else if (res.startsWith('Error')) {
        _colorTexto = Colors.red;
      } else {
        _colorTexto = Colors.blue.shade900;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2: Pago de Trabajador'),
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
                labelText: 'Nombre del trabajador',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _horasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Horas trabajadas en la semana',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _pagoHoraController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Pago por hora (S/)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ejecutarCalculo,
              child: const Text('Calcular sueldo'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _colorTexto,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}