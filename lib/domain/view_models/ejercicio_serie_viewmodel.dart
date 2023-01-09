import 'package:gym_app/domain/ejercicio.dart';
import 'package:gym_app/domain/serie.dart';

class EjercicioSerieViewModel {
  Ejercicio ejercicio;
  List<Serie> series;

  EjercicioSerieViewModel({required this.ejercicio, required this.series});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ejercicio'] = ejercicio;
    data['series'] = series.map((e) => e.toJson()).toList();
    return data;
  }
}
