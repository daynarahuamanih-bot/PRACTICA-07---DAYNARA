class Ejercicio4Controller {
  String calcular({
    required String marca,
    required String distanciaStr,
    required String combustibleStr,
  }) {
    // Validar campos vacíos
    if (marca.trim().isEmpty ||
        distanciaStr.trim().isEmpty ||
        combustibleStr.trim().isEmpty) {
      return 'Advertencia: Todos los campos son obligatorios.';
    }

    final double? distancia = double.tryParse(distanciaStr);
    final double? combustible = double.tryParse(combustibleStr);

    if (distancia == null || combustible == null) {
      return 'Advertencia: Ingrese valores numéricos válidos.';
    }

    // Condición 4: La distancia y el combustible deben ser mayores que cero
    if (distancia <= 0 || combustible <= 0) {
      return 'Advertencia: La distancia y el combustible deben ser mayores que 0.';
    }

    // Condición 1: Dividir distancia recorrida entre combustible utilizado
    final double rendimiento = distancia / combustible;

    // Condiciones 2 y 3: Evaluación de rendimiento
    final String estado =
        rendimiento >= 15 ? 'Buen rendimiento' : 'Rendimiento bajo';

    return 'Vehículo: ${marca.trim()}\n'
        'Rendimiento: ${rendimiento.toStringAsFixed(2)} km/l\n'
        'Evaluación: $estado';
  }
}