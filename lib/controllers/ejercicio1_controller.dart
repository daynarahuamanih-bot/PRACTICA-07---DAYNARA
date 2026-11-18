class Ejercicio1Controller {
  String calcular({
    required String nombre,
    required String nota1Str,
    required String nota2Str,
    required String nota3Str,
  }) {   
    // Validar campos vacíos
    if (nombre.trim().isEmpty ||
        nota1Str.trim().isEmpty ||
        nota2Str.trim().isEmpty ||
        nota3Str.trim().isEmpty) {
      return 'Advertencia: Todos los campos son obligatorios.';
    }

    double? n1 = double.tryParse(nota1Str);
    double? n2 = double.tryParse(nota2Str);
    double? n3 = double.tryParse(nota3Str);

    if (n1 == null || n2 == null || n3 == null) {
      return 'Advertencia: Ingrese valores numéricos válidos.';
    }


    if (n1 < 0 || n1 > 20 || n2 < 0 || n2 > 20 || n3 < 0 || n3 > 20) {
      return 'Error: Las notas deben estar comprendidas entre 0 y 20.';
    }

    double promedio = (n1 + n2 + n3) / 3;
    bool aprobado = promedio >= 13; 

    return 'Estudiante: $nombre\n'
        'Promedio Final: ${promedio.toStringAsFixed(2)}\n'
        'Estado: ${aprobado ? "Aprobado" : "Desaprobado"}';
  }
}