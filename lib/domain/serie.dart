import 'package:uuid/uuid.dart';

class Serie {
  String id;
  int numeroSerie;
  String tipoSerie;
  int? peso;
  int? repes;
  int? tiempo;
  bool check;
  OtrosDatosSerie otrosDatos;

  Serie({
    required this.id,
    required this.numeroSerie,
    required this.tipoSerie,
    this.peso,
    this.repes,
    this.tiempo,
    required this.check,
    required this.otrosDatos,
  });

  static createTestSerie(int numeroSerie) {
    return Serie(
        id: const Uuid().toString(),
        numeroSerie: numeroSerie,
        tipoSerie: 'N',
        check: false,
        otrosDatos: OtrosDatosSerie(pesoAnterior: 6, repesAnterior: 12));
  }
}

class OtrosDatosSerie {
  int? pesoAnterior;
  int? repesAnterior;
  int? tiempoAnterior;

  OtrosDatosSerie({
    this.pesoAnterior,
    this.repesAnterior,
    this.tiempoAnterior,
  });
}
