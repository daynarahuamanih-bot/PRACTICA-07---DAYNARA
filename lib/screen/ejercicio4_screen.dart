import 'package:flutter/material.dart';
import '../controllers/ejercicio4_controller.dart';

class Ejercicio4Screen extends StatefulWidget {
  const Ejercicio4Screen({super.key});

  @override
  State<Ejercicio4Screen> createState() => _Ejercicio4ScreenState();
}

class _Ejercicio4ScreenState extends State<Ejercicio4Screen> {
  final _marcaController = TextEditingController();
  final _distanciaController = TextEditingController();
  final _combustibleController = TextEditingController();
  final _controller = Ejercicio4Controller();

  String _resultado = '';

  void _calcularRendimiento() {
    setState(() {
      _resultado = _controller.calcular(
        marca: _marcaController.text,
        distanciaStr: _distanciaController.text,
        combustibleStr: _combustibleController.text,
      );
    });
  }

  @override
  void dispose() {
    _marcaController.dispose();
    _distanciaController.dispose();
    _combustibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 4: Combustible')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _marcaController,
                decoration: const InputDecoration(
                  labelText: 'Marca del vehículo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _distanciaController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Distancia recorrida (km)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _combustibleController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Combustible utilizado (litros)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularRendimiento,
                child: const Text('Calcular rendimiento'),
              ),
              const SizedBox(height: 20),
              if (_resultado.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Text(
                    _resultado,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}