class Ejercicio2Controller {
  String calcularSueldo({
    required String nombre,
    required String horasTraba,
    required String pagoHoraTraba,
  }) {
   
    if (nombre.trim().isEmpty) {
      return 'Ingrese el nombre del trabajador';
    }

    double? horas = double.tryParse(horasTraba);
    double? pagoh = double.tryParse(pagoHoraTraba);

    if (horas == null || pagoh == null || horas < 0 || pagoh < 0) {
      return 'Ingrese valores numéricos válidos';
    }

    double sueldoTotal = 0;
    double pagohoraExtra = 0;

    if (horas <= 48) {
      sueldoTotal = horas * pagoh;
    } else {
      double horasExtras = horas - 48;
      pagohoraExtra = pagoh *0.5;
      sueldoTotal = (48 * pagoh) + (horasExtras * pagohoraExtra);
    }

    return 'Trabajador: $nombre\n'
        'Sueldo Total: S/ ${sueldoTotal.toStringAsFixed(2)}';
  }
}