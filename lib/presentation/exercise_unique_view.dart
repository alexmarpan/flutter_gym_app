import 'package:flutter/material.dart';
import 'package:gym_app/domain/view_models/exercise_serie_viewmodel.dart';
import 'package:gym_app/presentation/serie_list_view.dart';

class ExerciseUniqueView extends StatefulWidget {
  final ValueChanged<ExerciseSerieViewModel> selected;
  final ExerciseSerieViewModel exercise;

  const ExerciseUniqueView(
      {Key? key, required this.exercise, required this.selected})
      : super(key: key);

  @override
  State<ExerciseUniqueView> createState() => _ExerciseUniqueViewState();
}

class _ExerciseUniqueViewState extends State<ExerciseUniqueView> {
  bool _showSerie = true;

  @override
  Widget build(BuildContext context) {
    return _builderRowExercise(widget.exercise);
  }

  Column _builderRowExercise(ExerciseSerieViewModel exercise) {
    List<Widget> children = [
      generateTitulo(exercise),
      const SizedBox(height: 10),
      SerieListView(exercise: exercise, visible: _showSerie)
    ];

    return Column(children: children);
  }

  Row generateTitulo(ExerciseSerieViewModel exercise) {
    return Row(children: [
      Expanded(
          flex: 25,
          child: TextButton(
              onPressed: () {
                changeShowSerie();
              },
              onLongPress: () => widget.selected(exercise),
              style: const ButtonStyle(alignment: Alignment.topLeft),
              child: Text(exercise.exercise.nombre,
                  style: const TextStyle(fontSize: 24)))),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PopupMenuButton<String>(
              tooltip: 'Opciones exercise',
              splashRadius: 20.0,
              itemBuilder: (context) => [
                /**
                  * añadir nota, crear superserie 
                  * cambiar exercise
                  * tiempo de descanso, tipo de peso (kg, lb)
                  * eliminar exercise 
                  */
                const PopupMenuItem(
                    value: 'cambiar', child: Text('Cambiar exercise')),
                const PopupMenuItem(
                    value: 'borrar', child: Text('Borrar exercise'))
              ],
            )
          ],
        ),
      )
    ]);
  }

  void changeShowSerie() {
    _showSerie = !_showSerie;
    setState(() {});
  }
}
