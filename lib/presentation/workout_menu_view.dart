import 'package:flutter/material.dart';
import 'package:gym_app/shared/utils.dart';
import 'package:gym_app/domain/exercise.dart';
import 'package:gym_app/domain/serie.dart';
import 'package:gym_app/domain/view_models/exercise_serie_viewmodel.dart';
import 'package:gym_app/presentation/exercise_list_view.dart';

class MenuWorkoutView extends StatefulWidget {
  const MenuWorkoutView({super.key});

  @override
  State<MenuWorkoutView> createState() => _MenuWorkoutViewState();
}

class _MenuWorkoutViewState extends State<MenuWorkoutView> {
  late Future<List<ExerciseSerieViewModel>?> _exercises;

  @override
  void initState() {
    super.initState();
    _exercises = getExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: _exercises,
            builder: ((BuildContext context, AsyncSnapshot snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(child: Text('Cargando exercise ...'));
              }

              if (snap.hasError || !snap.hasData) {
                return const Center(child: Text('No hay datos'));
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    buttonSaveWorkouting(snap.data),
                    ExerciseListView(exercises: snap.data),
                    addExercise(snap.data),
                  ],
                ),
              );
            })));
  }

  TextButton addExercise(List<ExerciseSerieViewModel> exercises) {
    return TextButton(
        onPressed: () {
          generateExercise(exercises);
        },
        child: const Text('Añadir exercise', style: TextStyle(fontSize: 26)));
  }

  void generateExercise(List<ExerciseSerieViewModel> exercises) {
    exercises.add(Exercise.createTestExercise('Press banca'));
    setState(() {});
  }

  TextButton buttonSaveWorkouting(List<ExerciseSerieViewModel> exercises) {
    return TextButton(
        onPressed: () {
          saveWorkouting(exercises);
        },
        child: const Text('Guardar entrenamiento',
            style: TextStyle(fontSize: 20)));
  }

  void saveWorkouting(List<ExerciseSerieViewModel> exercises) {
    writeToFile('${DateTime.now().microsecondsSinceEpoch ~/ 1000}_train.json',
        exercises[0].toJson());
  }
}

Future<List<ExerciseSerieViewModel>?> getExercises() async {
  List<ExerciseSerieViewModel> lvm = [];

  List<Serie> ls = [];
  for (int i = 0; i < 2; i++) {
    ls.add(Serie.createTestSerie(i));
  }

  lvm.add(ExerciseSerieViewModel(
      exercise: Exercise.createTestExercise('Bicep curl'), series: ls));

  return lvm.isNotEmpty ? lvm : null;
}
