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
        id: const Uuid().v4().toString(),
        idMusculo: const Uuid().v4().toString(),
        idCategoria: const Uuid().v4().toString(),
        nombre: nombre);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idMusculo'] = idMusculo;
    data['idCategoria'] = idCategoria;
    data['nombre'] = nombre;
    return data;
  }
}
