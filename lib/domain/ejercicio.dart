import 'package:uuid/uuid.dart';

class Ejercicio {
  String id;
  String idMusculo;
  String idCategoria;
  String nombre;

  Ejercicio({
    required this.id,
    required this.idMusculo,
    required this.idCategoria,
    required this.nombre,
  });

  static createTestEjercicio(String nombre) {
    return Ejercicio(
        id: const Uuid().toString(),
        idMusculo: const Uuid().toString(),
        idCategoria: const Uuid().toString(),
        nombre: nombre);
  }
}
