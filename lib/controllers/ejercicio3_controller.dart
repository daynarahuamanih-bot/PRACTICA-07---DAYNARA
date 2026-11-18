class Ejercicio3Controller {
  String calcular({
    required String nombreProducto,
    required String precioStr,
    required String descuentoStr,
  }) {
    // Validar campos vacíos
    if (nombreProducto.trim().isEmpty ||
        precioStr.trim().isEmpty ||
        descuentoStr.trim().isEmpty) {
      return 'Advertencia: Todos los campos son obligatorios.';
    }

    final double? precio = double.tryParse(precioStr);
    final double? porcentaje = double.tryParse(descuentoStr);

    if (precio == null || porcentaje == null) {
      return 'Advertencia: Ingrese valores numéricos válidos.';
    }

    // Condición 4: El precio del producto debe ser mayor que cero
    if (precio <= 0) {
      return 'Advertencia: El precio debe ser mayor que 0.';
    }

    // Condición 3: El descuento debe estar entre 0% y 100%
    if (porcentaje < 0 || porcentaje > 100) {
      return 'Advertencia: El descuento debe estar entre 0% y 100%.';
    }

    // Cálculos
    final double montoDescuento = precio * (porcentaje / 100);
    final double precioFinal = precio - montoDescuento;

    // Condiciones 1 y 2: Tipo de descuento
    final String tipoDescuento =
        porcentaje >= 20 ? 'Descuento especial' : 'Descuento regular';

    return 'Producto: ${nombreProducto.trim()}\n'
        'Descuento aplicado: S/ ${montoDescuento.toStringAsFixed(2)}\n'
        'Precio final: S/ ${precioFinal.toStringAsFixed(2)}\n'
        'Estado: $tipoDescuento';
  }
}