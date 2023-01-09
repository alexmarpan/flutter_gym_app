import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gym_app/shared/utils.dart';
import 'package:gym_app/domain/ejercicio.dart';
import 'package:gym_app/domain/serie.dart';
import 'package:gym_app/domain/view_models/ejercicio_serie_viewmodel.dart';
import 'package:gym_app/presentation/ejercicio_list_view.dart';

class MenuEntrenamientoView extends StatefulWidget {
  const MenuEntrenamientoView({super.key});

  @override
  State<MenuEntrenamientoView> createState() => _MenuEntrenamientoViewState();
}

class _MenuEntrenamientoViewState extends State<MenuEntrenamientoView> {
  late Future<List<EjercicioSerieViewModel>?> _ejercicios;

  @override
  void initState() {
    super.initState();
    _ejercicios = getEjercicios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: _ejercicios,
            builder: ((BuildContext context, AsyncSnapshot snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(child: Text('Cargando ejercicio ...'));
              }

              if (snap.hasError || !snap.hasData) {
                return const Center(child: Text('No hay datos'));
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    buttonSaveTraining(snap.data),
                    EjercicioListView(ejercicios: snap.data),
                    addEjercicio(snap.data),
                  ],
                ),
              );
            })));
  }

  TextButton addEjercicio(List<EjercicioSerieViewModel> ejercicios) {
    return TextButton(
        onPressed: () {
          generateEjercicio(ejercicios);
        },
        child: const Text('Añadir ejercicio', style: TextStyle(fontSize: 26)));
  }

  void generateEjercicio(List<EjercicioSerieViewModel> ejercicios) {
    ejercicios.add(Ejercicio.createTestEjercicio('Press banca'));
    setState(() {});
  }

  TextButton buttonSaveTraining(List<EjercicioSerieViewModel> ejercicios) {
    return TextButton(
        onPressed: () {
          saveTraining(ejercicios);
        },
        child: const Text('Guardar entrenamiento',
            style: TextStyle(fontSize: 20)));
  }

  void saveTraining(List<EjercicioSerieViewModel> ejercicios) {
    print(json.encode(ejercicios[0].ejercicio.toJson()));
    print(ejercicios[0]
        .series
        .map((e) => print('peso: ${e.peso} y repes: ${e.repes}')));
    writeToFile('${DateTime.now().microsecondsSinceEpoch ~/ 1000}_train.json',
        ejercicios[0].toJson());
  }
}

Future<List<EjercicioSerieViewModel>?> getEjercicios() async {
  List<EjercicioSerieViewModel> lvm = [];

  List<Serie> ls = [];
  for (int i = 0; i < 2; i++) {
    ls.add(Serie.createTestSerie(i));
  }

  lvm.add(EjercicioSerieViewModel(
      ejercicio: Ejercicio.createTestEjercicio('Bicep curl'), series: ls));

  return lvm.isNotEmpty ? lvm : null;
}
