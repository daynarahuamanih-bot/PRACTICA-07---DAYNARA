import 'package:flutter/material.dart';
import '../controllers/ejercicio3_controller.dart';

class Ejercicio3Screen extends StatefulWidget {
  const Ejercicio3Screen({super.key});

  @override
  State<Ejercicio3Screen> createState() => _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _descuentoController = TextEditingController();
  final _controller = Ejercicio3Controller();

  String _resultado = '';

  void _calcularDescuento() {
    setState(() {
      _resultado = _controller.calcular(
        nombreProducto: _nombreController.text,
        precioStr: _precioController.text,
        descuentoStr: _descuentoController.text,
      );
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    _descuentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 3: Descuento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del producto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _precioController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Precio del producto (S/)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _descuentoController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Porcentaje de descuento (%)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularDescuento,
                child: const Text('Calcular descuento'),
              ),
              const SizedBox(height: 20),
              if (_resultado.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
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