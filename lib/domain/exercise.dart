import 'package:uuid/uuid.dart';

class Exercise {
  String id;
  String idMusculo;
  String idCategoria;
  String nombre;

  Exercise({
    required this.id,
    required this.idMusculo,
    required this.idCategoria,
    required this.nombre,
  });

  static createTestExercise(String nombre) {
    return Exercise(
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

  static fromJson(Map<String, dynamic> json) {
    return Exercise(
        id: json['id'],
        idMusculo: json['idMusculo'],
        idCategoria: json['idCategoria'],
        nombre: json['nombre']);
  }
}
